# frozen_string_literal: true

require_relative '../keys.rb'
require 'twitter'
require_relative 'scrapper_subj.rb'

class TwitterControl
  attr_accessor :client
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = Consumer_key
    config.consumer_secret     = Consumer_secret
    config.access_token        = Access_token
    config.access_token_secret = Access_token_secret
  end

  def post(post)
    if post.size > 140
      raise 'Invalid post. Too long'
      p 'test'
    else
      @client.update(post)
    end
  end

  def search_hashtag(hashtag)
    @client.search(hashtag)
  end

  def follow(profile)
    @client.follow(profile)
  end

  def control_during_day
    posts = [scr.get_title, scr.get_link]

    posts.each do |post|
      p client.update(post)
      sleep(60)
    end
  end
end

# client.search('#lvchrist').each { |x| client.update "@#{x.user.screen_name} Hey, Im learning" }
# client.followers # fetch list of followers
