require_relative 'user_keys'
require_relative '../keys.rb'
require 'twitter'
require 'pry'
require 'csv'

class TwitterControl
  attr_accessor :client, :f_count, :followers_list
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = CONSUMER_KEY
      config.consumer_secret = CONSUMER_SECRET
      config.access_token = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
    @followers_list = client.follower_ids.attrs[:ids]
    @f_count = @followers_list.size
  end

  def post(post, seconds)
    raise 'Invalid post. Too long' if post.size > 280

    sleep(seconds)
    @client.update(post)
  end

  def follow(profile)
    @client.follow(profile)
  end

  def get_tweet_content(hashtag)
    client.search(hashtag).take(100)
  end

  def tweet_content_to_csv(hashtag)
    CSV.open('tweets.csv', 'w') do |csv|
      get_tweet_content(hashtag).each do |tweet|
        csv << [tweet.full_text, tweet.user, tweet.user.name,
                tweet.user.location,
                tweet.user.followers_count, tweet.user.email]
      end
    end
  end

  def catch_new_followers
    temp = client.follower_ids.attrs[:ids]
    to_send_dm = []
    if @f_count < temp.size
      temp.each { |x| to_send_dm << x if @followers_list.include?(x) == false }
    end
    to_send_dm
  end

  def dm_new_follower
    list = catch_new_followers
    if list.size.positive?
      list.each do |x|
        @client.follow(x)
        client.create_direct_message(x, 'Hey, Thanks for following us. Do you want to know more?')
        @followers_list << x
      end
    end
    @followers_list
  end

  def interactor(hashtag, time)
    sleep(time)
    client.search(hashtag).each do |x|
      client.update "@#{x.user.screen_name}
    Hey, If you want to know more please follow me."
      client.follow(x.user.screen_name)
    end
  end
end
