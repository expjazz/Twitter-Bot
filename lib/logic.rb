# frozen_string_literal: true

require_relative 'weather'
require_relative 'greeting_content'

class FinalMessage
  attr_reader :weather, :greeting
  def initialize
    @weather = Weather.new
    @greeting = Greetings.new
  end

  def weather_logic_morning
    m1 = "#{@greeting.morning_list} #{@weather.main_description}."
    if @weather.temperature > 20
      m2 = "#{@greeting.morning_list_hot} #{@weather.temperature} Celsius."
    elsif @weather.temperature < 20
      m2 = "#{@greeting.morning_list_hot} #{@weather.temperature} Celsius."
    end

    m1 + m2
  end

  def weather_logic_night
    m1 = "#{@greeting.night_list} #{@weather.main_description}."
    if @weather.temperature > 20
      m2 = "#{@greeting.night_list_warm} #{@weather.temperature} Celsius."
    elsif @weather.temperature < 20
      m2 = "#{@greeting.night_list_cold} #{@weather.temperature} Celsius."
    end

    m1 + m2
  end
end
