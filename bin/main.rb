# frozen_string_literal: true

require_relative '../lib/logic'
require_relative '../lib/twitter_control'
require_relative '../lib/store'
require_relative '../lib/scrapper_subj'
require_relative '../lib/quotes'

controller = TwitterControl.new
greeter_content = FinalMessage.new
store_content = StoreScrapper.new
scrapper = Scrapper.new('Clothing tendencies for the summer')
quotes = Quotes.new
# In the morning, 9am
controller.post(greeter_content.weather_logic_morning)
sleep(35)
controller.post('A great day to use one of our amazing products!!')
sleep(10)
controller.post("Please check out this amazing offer: #{store_content.product},
     #{store_content.product_link}")
sleep(90)
controller.post("If you like fashion, you will love this
     little article: #{scrapper.get_text}. You can check the link here:
     #{scrapper.get_link}") # needs to be rotational
sleep(120)
controller.interactor(controller.search_hashtag)
sleep(120)
controller.post('If you like to reflect on life, you will like this: ')
sleep(10)
controller.post(quotes.quote + ',' + quotes.author)
sleep(100)
controller.interacter(controller.search_hashtag)
sleep(30)
controller.post("Please check out this amazing offer: #{store_content.product},
    #{store_content.product_link}") # needs to be rotational
sleep(250)
controller.post("Don't know how to match your wardrobe?
    Check this amazing article in the next tweet...")
sleep(10)
controller.post("#{scrapper.educational_text} #{scrapper.educational_link}")
sleep(200)
controller.post(greeter_content.weather_logic_night)
