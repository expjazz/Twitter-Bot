require 'nokogiri'
require 'httparty'
require 'pry'
require 'selenium-webdriver'
class Scrapper
  attr_reader :doc
  def initialize(subject)
    @subject = subject
    @driver = Selenium::WebDriver.for :firefox
    @driver.get "https://www.google.com/search?q=#{@subject}"
    @doc = Nokogiri::HTML @driver.page_source
    @driver.quit
  end

  def get_text(index)
    @doc.css('h3.LC20lb')[index].text
  end

  def get_link(index)
    @doc.css('div.r')[index].children[0].attributes['href'].value
  end
end

# p test.get_link(5)
