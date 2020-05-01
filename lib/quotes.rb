# frozen_string_literal: true

require 'httparty'
require 'net/http'
require 'openssl'
require 'pry'

class Quotes
  attr_reader :quote, :@response
  def initialize
    @request = HTTParty.get('http://quotes.rest/qod.json')
    @response = JSON.parse(request.body)
    @quote = response['contents']['quotes'][0]['quote']
    @author = response['contents']['quotes'][0]['author']
  end
end
