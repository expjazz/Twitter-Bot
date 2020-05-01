# frozen_string_literal: true

require_relative '../keys.rb'
require 'twitter'
require_relative 'scrapper_subj.rb'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Consumer_key
  config.consumer_secret     = Consumer_secret
  config.access_token        = Access_token
  config.access_token_secret = Access_token_secret
end
def control_during_day
  posts = [scr.get_title, scr.get_link]

  posts.each do |post|
    p client.update(post)
    sleep(60)
  end
end

client.search('#lvchrist').each { |x| client.update "@#{x.user.screen_name} Hey, Im learning" }
# client.followers # fetch list of followers
