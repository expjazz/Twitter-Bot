# frozen_string_literal: true

require_relative '../keys.rb'
require 'twitter'
require 'pry'
require 'csv'

class TwitterControl
  attr_accessor :client
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Consumer_key
      config.consumer_secret     = Consumer_secret
      config.access_token        = Access_token
      config.access_token_secret = Access_token_secret
    end
  end

  def post(post, seconds)
    if post.size > 280
      raise 'Invalid post. Too long'
    else
      sleep(seconds)
      @client.update(post)
    end
  end

  def follow(profile)
    @client.follow(profile)
  end

  def get_tweet_content(hashtag)
    client.search(hashtag).take(10)
  end

  def tweet_content_to_csv(hashtag)
    CSV.open('tweets.csv', 'w') do |csv|
      get_tweet_content(hashtag).take(10).each { |tweet| csv << [tweet.full_text, tweet.user, tweet.user.name, tweet.user.location, tweet.user.followers_count, tweet.user.email] }
    end
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
# client.search('#lvchrist').each { |x| client.update "@#{x.user.screen_name} Hey, Im learning" }
# client.followers # fetch list of followers
# test.tweet_content_to_csv('#GolpeDeEstado')
