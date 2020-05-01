# frozen_string_literal: true

require_relative '../lib/logic'
require_relative '../lib/twitter_control'
require_relative '../lib/store'
require_relative '../lib/scrapper_subj'
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Consumer_key
  config.consumer_secret     = Consumer_secret
  config.access_token        = Access_token
  config.access_token_secret = Access_token_secret
end

controller = TwitterControl.new
greeter_content = FinalMessage.new
store_content = StoreScrapper.new
scrapper = Scrapper.new('Clothing tendencies for the summer')

# In the morning, 9am
client.update(greeter_content.weather_logic_morning)
sleep(35)
client.update('A great day to use one of our amazing products!!')
sleep(87)
client.update(store_content.product)
sleep(112)
client.update(store_content.product_link)
sleep(33)
client.update(scrapper.get_text)
sleep(78)
client.update(scrapper.get_link)
