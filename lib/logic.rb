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
    m1 = "We have today a day with #{@weather.main_description}."
    if @weather.temperature > 20
      m2 = "We will have a very hot day, with a temperature of #{@weather.temperature} Celsius."
    elsif @weather.temperature < 20
      m2 = "We will have a breezing day, with a temperature of #{@weather.temperature} Celsius."
    end

    m1 + m2
  end
end
