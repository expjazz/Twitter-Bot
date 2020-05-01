# frozen_string_literal: true

class Greetings
  attr_accessor :greeting
  def initialize(greeting = nil)
    @morning_list = []
    @afternoon_list = []
    @night_list = []
    @greeting = greeting
  end

  def morning_list
    @morning_list = ['Good Morning!', 'Hey, Have a nice day!']
    @morning_list.sample
  end

  def afternoon_list
    @afternoon_list = ['Hope you are having a great day!', 'Have a great afternoon!']
    @afternoon_list.sample
  end

  def night_list
    @night_list = ['Hope you had a GREAT day!', 'Have an awesome night!']
    @night_list.sample
  end
end
