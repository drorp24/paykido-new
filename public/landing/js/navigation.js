/*
 * jQuery One Page Nav Plugin
 * http://github.com/davist11/jQuery-One-Page-Nav
 *
 * Copyright (c) 2010 Trevor Davis (http://trevordavis.net)
 * Dual licensed under the MIT and GPL licenses.
 * Uses the same license as jQuery, see:
 * http://jquery.org/license
 *
 * @version 0.4
 */
(function(a){a.fn.onePageNav=function(b){var c=a.extend({},a.fn.onePageNav.defaults,b),d={};d.sections={};d.bindNav=function(g,k,j,f,h){var i=g.parent(),e=g.attr("href"),l=a(document);if(!i.hasClass(j)){d.adjustNav(k,i,j);l.unbind(".onePageNav");a.scrollTo(e,h,{onAfter:function(){if(f){window.location.hash=e}l.bind("scroll.onePageNav",function(){d.scrollChange(k,j)})}})}};d.adjustNav=function(g,e,f){g.find("."+f).removeClass(f);e.addClass(f)};d.getPositions=function(e){e.find("a").each(function(){var h=a(this).attr("href"),g=a(h).offset(),f=g.top;d.sections[h.substr(1)]=Math.round(f)})};d.getSection=function(h){var e="",g=Math.round(a(window).height()/2);for(var f in d.sections){if((d.sections[f]-g)<h){e=f}}return e};d.scrollChange=function(h,g){d.getPositions(h);var f=a(window).scrollTop(),e=d.getSection(f);if(e!==""){d.adjustNav(h,h.find("a[href=#"+e+"]").parent(),g)}};d.init=function(f,g){f.find("a").bind("click",function(h){d.bindNav(a(this),f,g.currentClass,g.changeHash,g.scrollSpeed);h.preventDefault()});d.getPositions(f);var e=false;a(document).bind("scroll.onePageNav",function(){e=true});setInterval(function(){if(e){e=false;d.scrollChange(f,g.currentClass)}},250)};return this.each(function(){var e=a(this),f=a.meta?a.extend({},c,e.data()):c;d.init(e,f)})};a.fn.onePageNav.defaults={currentClass:"current",changeHash:false,scrollSpeed:750}})(jQuery);

$(document).ready(function() {
  $('#menu').onePageNav();
});
