# frozen_string_literal: true

require_relative '../lib/greeting_content'

describe Greetings do
  let(:obj) { Greetings.new }
  describe '#list' do
    it 'should return a string for the tweet' do
      expect(obj.list).to be_a(String)
    end
  end

  describe '#warm' do
    it 'should return a string for the tweet' do
      expect(obj.warm).to be_a(String)
    end
  end

  describe '#cold' do
    it 'should return a string for the tweet' do
      expect(obj.cold).to be_a(String)
    end
  end
end
