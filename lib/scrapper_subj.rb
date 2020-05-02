# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'pry'
require 'selenium-webdriver'
class Scrapper
  attr_reader :subject, :unparsed_page, :parsed_page

  def initialize(subject)
    @subject = subject
    @driver = Selenium::WebDriver.for :firefox
    @driver.get "https://www.google.com/search?q=#{@subject}"
    @doc = Nokogiri::HTML @driver.page_source
  end

  def get_text(index)
    @doc.css('h3.LC20lb')[index].text
  end

  def get_link(index)
    @doc.css('div.r')[index].children[0].attributes['href'].value
  end
end

# test = Scrapper.new('Best clothes for the whole summer')

# p test.get_text(5)
# p test.get_link(5)
