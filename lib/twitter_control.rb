# frozen_string_literal: true

require 'twitter'

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

  def interactor(_search_list, hashtag)
    client.search(hashtag).each do |x|
      client.update "@#{x.user.screen_name}
    Hey, If you want to know more please follow me."
      client.follow(x.user.screen_name)
    end
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
