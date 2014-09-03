Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_KEY"] || ENV["GOOGLE_APP_ID"], ENV["GOOGLE_SECRET"] || ENV["GOOGLE_SECRET_KEY"]
end
