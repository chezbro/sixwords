class Word < ActiveRecord::Base
  belongs_to :user
  validates :description, length: { maximum: 140 }

  # validate :limit

  #   def limit

  #     string_arr = self.split(' ')
  #       if string_arr.count > 6
  #         errors.add :base, "6 Words Max!"
  #       end
  #   end

  # def words_limit
  #   string_arr = self.split(' ')
  #   string_arr.count > 6 ? "#{string_arr[0..(limit-1)].join(' ')}..." : self
  # end
  def initialize_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["SIXWORDS_APP_ID"]
      config.consumer_secret     = ENV["SIXWORDS_APP_SECRET"]
      config.access_token        = ENV["SIXWORDS_ACCESS_TOKEN"]
      config.access_token_secret = ENV["SIXWORDS_ACCESS_TOKEN_SECRET"]
    end
  end

  # def user_timeline(qt)
  #   twitter_client = initialize_twitter_client
  #   twitter_client.user_timeline(count: qt)
  # end

end
