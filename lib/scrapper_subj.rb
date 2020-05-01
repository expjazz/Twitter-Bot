# frozen_string_literal: true

require 'nokogiri'
require 'httparty'
require 'pry'

class Scrapper
  attr_reader :subject, :unparsed_page, :parsed_page

  def initialize(subject)
    temp = subject.split('')
    @subject = temp.join('+')
    @unparsed_page = HTTParty.get("https://www.google.com/search?q=#{@subject}")
    @doc = Nokogiri::HTML(@unparsed_page)

    @parsed_page = Nokogiri::HTML(unparsed_page)
  end

  def get_title
    title = @doc.css('div.BNeawe')[0].text
    title
  end

  def get_link
    link = @doc.css('div.kCrYT')[0].child.attributes['href'].value
    link[7, link.size]
  end
end

test = Scrapper.new('Best books to read')
p test.get_title
p test.get_link
