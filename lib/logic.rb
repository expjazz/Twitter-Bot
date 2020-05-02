# frozen_string_literal: true

require_relative 'weather'
require_relative 'greeting_content'
require 'time'
class FinalMessage
  attr_reader :weather, :greeting
  def initialize
    @time = Time.now
    @weather = Weather.new
    @greeting = Greetings.new
  end

  def time_logic
    if @time.to_s.split[1] < '12'
      'Since we are in the begining of the day'
    elsif @time.to_s.split[1] >= '12' && @time.to_s.split[1] < '18'
      'Have a great afternoon'
    else
      'We are almost finishing the day'
    end
  end

  def weather_logic
    m1 = "#{@greeting.list} #{@weather.main_description}."
    if @weather.temperature > 20
      m2 = "#{@greeting.warm} #{@weather.temperature} Celsius."
    elsif @weather.temperature < 20
      m2 = "#{@greeting.cold} #{@weather.temperature} Celsius."
    end

    "#{time_logic} #{m1} #{m2}"
  end
end

test = FinalMessage.new
p test.weather_logic
