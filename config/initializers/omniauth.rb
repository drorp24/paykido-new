# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
#            :scope => 'email,offline_access,read_stream', :display => 'popup'
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook,FACEBOOK_APP_ID , FACEBOOK_APP_SECRET,
#            :scope => 'email,offline_access,read_stream', :display => 'popup'
# end