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
scr = Scrapper.new('Clothes for winter')

posts = [scr.get_title, scr.get_link]

posts.each do |post|
  p client.update(post)
  sleep(60)
end
