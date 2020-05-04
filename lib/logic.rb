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
      ['Since we are in the begining of the day',
       'Are you ready to conquer your daily challenges?',
       'We wish you a great day.'].sample
    elsif @time.to_s.split[1] >= '12' && @time.to_s.split[1] < '18'
      ['Have a great afternoon', 'Still in the middle of the battle!',
       'Take a little time to appreciate the beautifull day'].sample
    else
      ['We are almost finishing the day',
       'Take a moment to look how beautifull the sky is this night!',
       'Have a great night.'].sample
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
