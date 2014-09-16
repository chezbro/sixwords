class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # def load_tweets
  #   @tweets = twitter_client.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
  # end
  # $client = Twitter::Client.new(:oauth_token => ENV["SIXWORDS_ACCESS_TOKEN"], :oauth_token_secret => ENV["SIXWORDS_ACCESS_TOKEN_SECRET"]) do |config|
  #   config.consumer_key        = ENV["SIXWORDS_APP_ID"]
  #   config.consumer_secret     = ENV["SIXWORDS_APP_SECRET"]
  #   config.access_token        = ENV["SIXWORDS_ACCESS_TOKEN"]
  #   config.access_token_secret = ENV["SIXWORDS_ACCESS_TOKEN_SECRET"]
  # end


  private

  #-> Prelang (user_login:devise)
  def require_user_signed_in
    unless user_signed_in?

      # If the user came from a page, we can send them back.  Otherwise, send
      # them to the root path.
      if request.env['HTTP_REFERER']
        fallback_redirect = :back
      elsif defined?(root_path)
        fallback_redirect = root_path
      else
        fallback_redirect = "/"
      end

      redirect_to fallback_redirect, flash: {error: "You must be signed in to view this page."}
    end
  end

end
