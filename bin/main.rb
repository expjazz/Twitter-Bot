#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/logic'
require_relative '../lib/twitter_control'
require_relative '../lib/store'
require_relative '../lib/scrapper_subj'
require_relative '../lib/quotes'
require_relative '../lib/covid'

puts 'Hey! Good morning. I will be helping you to control your
twitter account today! What subject do you want displayed
on our articles section? Be carefull with the spelling'
subject = gets.chomp

puts 'Before I start, just want to remember that if you want to
stop the execution just press ctrl + c.'

covid = Corona.new
controller = TwitterControl.new
greeter_content = FinalMessage.new
store_content = StoreScrapper.new
scrapper = Scrapper.new(subject)
quotes = Quotes.new
count_product = 0
count_article = 0

loop do
  controller.post("Here are the news on corona.
     We have #{covid.confirmed} cases confirmed. #stayhome", 300)
  controller.post(greeter_content.weather_logic, 250)
  controller.seach('lvlvlvch', 240)
  controller.post('A great day to use one of our amazing products!!', 340)
  controller.post("Please check out this amazing offer:
     #{store_content.product_title(count_product)}", 10)
  controller.post(store_content.product_link(count_product), 3)
  count_product += 2
  controller.post("If you like fashion, you will love this
     little article: #{scrapper.get_text(count_article)}.", 450)
  controller.post("You can check the link here:
    #{scrapper.get_link(count_article)}", 3)
  count_article += 1
  controller.post("Here are some good news on the Covid-19.
     We have #{covid.recovered} cases that recovered. #stayhome", 400)
  controller.post('If you like to reflect on life, you will like this: ', 125)
  controller.post(quotes.quote + ',' + quotes.author, 3)
  controller.post("Please check out this amazing offer:
     #{store_content.product_title(count_product)}", 321)
  controller.post(store_content.product_link(count_product), 3)
  count_product += 2
  controller.post("If you like fashion, you will love this
     little article: #{scrapper.get_text(count_article)}.", 250)
  controller.post("You can check the link here:
    #{scrapper.get_link(count_article)}", 3)
  count_article += 1
  controller.post(greeter_content.weather_logic, 230)
end
