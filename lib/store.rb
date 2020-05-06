# frozen_string_literal: true

require 'nokogiri'
require 'httparty'

class StoreScrapper
  attr_reader :doc
  def initialize
    @unparsed_page =
      HTTParty.get('https://us.dolcegabbana.com/it/uomo/abbigliamento/')
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
