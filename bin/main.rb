# frozen_string_literal: true

require_relative '../lib/logic'
require_relative '../lib/twitter_control'
require_relative '../lib/store'
require_relative '../lib/scrapper_subj'
require_relative '../lib/quotes'

puts 'Hey! Good morning. I will be helping you to control your
twitter account today! What subject do you want displayed
on our articles section? Be carefull with the spelling'
subject = gets.chomp

controller = TwitterControl.new
greeter_content = FinalMessage.new
store_content = StoreScrapper.new
scrapper = Scrapper.new(subject)
quotes = Quotes.new
count_product = 0
count_article = 0

controller.post(greeter_content.weather_logic)
sleep(30)
controller.post('A great day to use one of our amazing products!!')
sleep(10)
controller.post("Please check out this amazing offer:
     #{store_content.product(count_product)},
     #{store_content.product_link(count)}")
count_product += 2
sleep(90)
controller.post("If you like fashion, you will love this
     little article: #{scrapper.get_text(count_article)}. You can check the link here:
     #{scrapper.get_link(count_article)}") # needs to be rotational
count_article += 1
sleep(120)
controller.interactor('lvlvlvchrist')
sleep(120)
controller.post('If you like to reflect on life, you will like this: ')
sleep(10)
controller.post(quotes.quote + ',' + quotes.author)
sleep(100)
controller.interactor('lvlvlvchrist')
sleep(30)
controller.post("Please check out this amazing offer:
     #{store_content.product(count_product)},
     #{store_content.product_link(count_product)}")
count_product += 2
sleep(250)
controller.post("Need tips on what to wear next?
    Check this amazing article in the next tweet...")
sleep(10)
controller.post("#{scrapper.get_text(count_article)},
                 #{scrapper.get_link(count_article)}")
count_article += 1
sleep(200)
controller.post(greeter_content.weather_logic)
