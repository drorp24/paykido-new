// jquery.pjax.js
// copyright chris wanstrath
// https://github.com/defunkt/jquery-pjax

(function($){

// When called on a link, fetches the href with ajax into the
// container specified as the first parameter or with the data-pjax
// attribute on the link itself.
//
// Tries to make sure the back button and ctrl+click work the way
// you'd expect.
//
// Accepts a jQuery ajax options object that may include these
// pjax specific options:
//
// container - Where to stick the response body. Usually a String selector.
//             $(container).html(xhr.responseBody)
//      push - Whether to pushState the URL. Defaults to true (of course).
//   replace - Want to use replaceState instead? That's cool.
//
// For convenience the first parameter can be either the container or
// the options object.
//
// Returns the jQuery object
$.fn.pjax = function( container, options ) {
  if ( options )
    options.container = container
  else
    options = $.isPlainObject(container) ? container : {container:container}

  // We can't persist $objects using the history API so we must use
  // a String selector. Bail if we got anything else.
  if ( typeof options.container !== 'string' ) {
    throw "pjax container must be a string selector!"
    return false
  }

  return this.live('click', function(event){
    // Middle click, cmd click, and ctrl click should open
    // links in a new tab as normal.
    if ( event.which > 1 || event.metaKey )
      return true

    var defaults = {
      url: this.href,
      container: $(this).attr('data-pjax'),
      clickedElement: $(this)
    }

    $.pjax($.extend({}, defaults, options))

    event.preventDefault()
  })
}


// Loads a URL with ajax, puts the response body inside a container,
// then pushState()'s the loaded URL.
//
// Works just like $.ajax in that it accepts a jQuery ajax
// settings object (with keys like url, type, data, etc).
//
// Accepts these extra keys:
//
// container - Where to stick the response body. Must be a String.
//             $(container).html(xhr.responseBody)
//      push - Whether to pushState the URL. Defaults to true (of course).
//   replace - Want to use replaceState instead? That's cool.
//
// Use it just like $.ajax:
//
//   var xhr = $.pjax({ url: this.href, container: '#main' })
//   console.log( xhr.readyState )
//
// Returns whatever $.ajax returns.
$.pjax = function( options ) {
  var $container = $(options.container),
      success = options.success || $.noop

  // We don't want to let anyone override our success handler.
  delete options.success

  // We can't persist $objects using the history API so we must use
  // a String selector. Bail if we got anything else.
  if ( typeof options.container !== 'string' )
    throw "pjax container must be a string selector!"

  var defaults = {
    timeout: 3000,
    push: false,
    replace: false,
    // We want the browser to maintain two separate internal caches: one for
    // pjax'd partial page loads and one for normal page loads. Without
    // adding this secret parameter, some browsers will often confuse the two.
    data: { _pjax: true },
    type: 'GET',
    dataType: 'html',
    beforeSend: function(xhr){
      $container.trigger('start.pjax')
      xhr.setRequestHeader('X-PJAX', 'true')
    },
    error: function(){
      window.location = options.url
    },
    complete: function(){
      $container.trigger('end.pjax')
    },
    success: function(data){
      // If we got no data or an entire web page, go directly
      // to the page and let normal error handling happen.
      if ( !$.trim(data) || /<html/i.test(data) )
        return window.location = options.url

      // Make it happen.
      $container.html(data)

      // If there's a <title> tag in the response, use it as
      // the page's title.
      var oldTitle = document.title,
          title = $.trim( $container.find('title').remove().text() )
      if ( title ) document.title = title

      var state = {
        pjax: options.container,
        timeout: options.timeout
      }

      // If there are extra params, save the complete URL in the state object
      var query = $.param(options.data)
      if ( query != "_pjax=true" )
        state.url = options.url + (/\?/.test(options.url) ? "&" : "?") + query

      if ( options.replace ) {
        window.history.replaceState(state, document.title, options.url)
      } else if ( options.push ) {
        // this extra replaceState before first push ensures good back
        // button behavior
        if ( !$.pjax.active ) {
          window.history.replaceState($.extend({}, state, {url:null}), oldTitle)
          $.pjax.active = true
        }

        window.history.pushState(state, document.title, options.url)
      }

      // Google Analytics support
      if ( (options.replace || options.push) && window._gaq )
        _gaq.push(['_trackPageview'])

      // Invoke their success handler if they gave us one.
      success.apply(this, arguments)
    }
  }

  options = $.extend(true, {}, defaults, options)

  if ( $.isFunction(options.url) ) {
    options.url = options.url()
  }

  // Cancel the current request if we're already pjaxing
  var xhr = $.pjax.xhr
  if ( xhr && xhr.readyState < 4) {
    xhr.onreadystatechange = $.noop
    xhr.abort()
  }

  $.pjax.xhr = $.ajax(options)
  $(document).trigger('pjax', $.pjax.xhr, options)

  return $.pjax.xhr
}


// Used to detect initial (useless) popstate.
// If history.state exists, assume browser isn't going to fire initial popstate.
var popped = ('state' in window.history), initialURL = location.href


// popstate handler takes care of the back and forward buttons
//
// You probably shouldn't use pjax on pages with other pushState
// stuff yet.
$(window).bind('popstate', function(event){
  // Ignore inital popstate that some browsers fire on page load
  var initialPop = !popped && location.href == initialURL
  popped = true
  if ( initialPop ) return

  var state = event.state

  if ( state && state.pjax ) {
    var container = state.pjax
    if ( $(container+'').length )
      $.pjax({
        url: state.url || location.href,
        container: container,
        push: false,
        timeout: state.timeout
      })
    else
      window.location = location.href
  }
})


// Add the state property to jQuery's event object so we can use it in
// $(window).bind('popstate')
if ( $.inArray('state', $.event.props) < 0 )
  $.event.props.push('state')


// Is pjax supported by this browser?
$.support.pjax = window.history && window.history.pushState

// pushState isn't reliable on iOS until 5.
&& !navigator.userAgent.match(/((iPod|iPhone|iPad).+\bOS\s+[1-4]|WebApps\/.+CFNetwork)/)


// Fall back to normalcy for older browsers.
if ( !$.support.pjax ) {
  $.pjax = function( options ) {
    window.location = $.isFunction(options.url) ? options.url() : options.url
  }
  $.fn.pjax = function() { return this }
}

})(jQuery);