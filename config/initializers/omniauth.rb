Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['SIXWORDS_APP_ID'], ENV['SIXWORDS_APP_SECRET']
end
