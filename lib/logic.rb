# frozen_string_literal: true

require_relative 'weather'
require_relative 'greeting_content'

class FinalMessage
  attr_reader :weather, :greeting
  def initialize
    @weather = Weather.new
    @greeting = Greetings.new
  end

  def weather_logic
    m1 = "#{@greeting.list} #{@weather.main_description}."
    if @weather.temperature > 20
      m2 = "#{@greeting.warm} #{@weather.temperature} Celsius."
    elsif @weather.temperature < 20
      m2 = "#{@greeting.cold} #{@weather.temperature} Celsius."
    end

    m1 + m2
  end
end
