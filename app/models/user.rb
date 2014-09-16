class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:omniauthable, :omniauth_providers => [:twitter]
  has_many :words

  def email_required?
    false
  end

  def email_changed?
    false
  end


  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.handle = auth["info"]["nickname"]
      user.image = auth["info"]["image"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
      user.email = "#{auth["info"]["nickname"]}@example.com"
      user.password = auth["uid"]
    end
  end

  def tweet
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["SIXWORDS_APP_ID"]
      config.consumer_secret     = ENV["SIXWORDS_APP_SECRET"]
      config.access_token        = ENV["SIXWORDS_ACCESS_TOKEN"]
      config.access_token_secret = ENV["SIXWORDS_ACCESS_TOKEN_SECRET"]
   end
 end

  # def configure
  #   Twitter::REST::Client.new do |config|
  #     config.access_token = self.token
  #     config.access_token_secret = self.secret
  #   end
  #   return self
  # end

  def get_friends
    # self.tweet

    # friend_ids = tweet.favorites
    # friends = []
    # friend_ids.each do |friend|
    #   friends << friend.user.screen_name
    # end
    # return friends

    # i = friend_ids.count / 100
    # i += 1 if (friend_ids.count % 100 > 0)

    # friends = []
    # i.times do |i|
    #   start = i * 100
    #   current_batch = friend_ids.slice( i * 100, 100 )
    #   for user in Twitter.users(current_batch) do
    #     friends << { label: user.name, value: user.screen_name, img: "https://api.twitter.com/1/users/profile_image/" + user.screen_name }
    #   end
    # end
    # return friends
  end

  private

    # def initialize_twitter_client
    #   Twitter::REST::Client.new do |config|
    #     config.consumer_key        = ENV["SIXWORDS_APP_ID"]
    #     config.consumer_secret     = ENV["SIXWORDS_APP_SECRET"]
    #     config.access_token        = ENV["SIXWORDS_ACCESS_TOKEN"]
    #     config.access_token_secret = ENV["SIXWORDS_ACCESS_TOKEN_SECRET"]
    #   end
    # end
end
