Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_SECRET_KEY']#, :scope => "http://www.google.com/m8/feeds"
end