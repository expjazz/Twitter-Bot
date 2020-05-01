# frozen_string_literal: true

require 'nokogiri'
require 'httparty'

class StoreScrapper
  attr_reader :product, :product_link
  def initialize
    @unparsed_page = HTTParty.get('https://www.anacapri.com.br/c/obanovidade')
    @doc = Nokogiri::HTML(@unparsed_page)
    @product = @doc.css('li.category-product')[0].text
    @product_link = 'https://www.anacapri.com.br' + @doc.xpath('//*[@id="product-list"]/div[3]/div[2]/ul/li[1]/div/a')[0].attributes['href'].value
  end
end
test = StoreScrapper.new

p test.product_link
