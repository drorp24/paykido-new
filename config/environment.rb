# Load the rails application
require File.expand_path('../application', __FILE__)
FACEBOOK_APP_ID          = "270198159687016"
FACEBOOK_APP_SECRET      = "df78ba4c23f52977858d10c0607fff2c"
FACEBOOK_APP_PERMISSIONS = "email,offline_access,publish_stream"
# Initialize the rails application
Paykido::Application.initialize!
