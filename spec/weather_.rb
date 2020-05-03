# frozen_string_literal: true

require_relative '../lib/weather'
describe Weather do
  let(:weather) { Weather.new }
  let(:temperature) { weather.instance_variable_get(:@temperature) }
  let(:main_description) { weather.instance_variable_get(:@main_description) }

  describe '#initialize' do
    it 'should get the temperature of the time as an string' do
      expect(temperature).to be_a(Float)
    end

    it 'should get the description of the weather of the time as an string' do
      expect(main_description).to be_a(String)
    end
  end
end
