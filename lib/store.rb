# frozen_string_literal: true

require 'nokogiri'
require 'httparty'

class StoreScrapper
  def initialize
    @unparsed_page = HTTParty.get('https://us.dolcegabbana.com/it/uomo/abbigliamento/')
    @doc = Nokogiri::HTML(@unparsed_page)
  end

  def product_title(index)
    temp = @doc.css('a.b-product_name')[index].text.downcase
    temp.capitalize[1, temp.size - 2]
  end

  def product_link(index)
    temp = @doc.css('a.b-product_name')[index].attributes['href'].value
    'https://us.dolcegabbana.com' + temp
  end
end

#       @product = @doc.css('li.category-product')[0].text
#     @product_link = 'https://www.anacapri.com.br' + @doc.xpath('//*[@id="product-list"]/div[3]/div[2]/ul/li[1]/div/a')[0].attributes['href'].value
#
