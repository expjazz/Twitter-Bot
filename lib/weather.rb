# frozen_string_literal: true

require_relative '../keys.rb'
require 'httparty'
require 'openssl'
require 'json'

class Weather
  attr_reader :temperature, :main_description, :details_description, :weather_id
  def initialize
    request =
      HTTParty.get(
        "http://api.openweathermap.org/data/2.5/forecast?id=2270968&units=metric&APPID=#{WEATHER_KEY}"
      )
    response = JSON.parse(request.body)
    @temperature = response['list'][0]['main']['temp']
    @main_description = response['list'][0]['weather'][0]['main']
    @details_description = response['list'][0]['weather'][0]['description']
    @weather_id = response['list'][0]['weather'][0]['id']
  end
end
