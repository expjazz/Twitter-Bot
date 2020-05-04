# frozen_string_literal: true

require_relative '../lib/logic'

describe FinalMessage do
  let(:obj) { FinalMessage.new }
  let(:weather) { obj.instance_variable_get(:@weather) }
  let(:greeting) { obj.instance_variable_get(:@greeting) }

  describe '#initialize' do
    it 'should initialize a weather as an weather object' do
      expect(weather).to be_a(Weather)
    end

    it 'should initialize a greeting as a greeting object' do
      expect(greeting).to be_a(Greetings)
    end
  end

  describe '#weather_logic' do
    it 'should return a string to be tweeted' do
      expect(obj.weather_logic).to be_a(String)
    end
  end
end
