# frozen_string_literal: true

require_relative '../lib/quotes.rb'

describe Quotes do
  let(:obj) { Quotes.new }
  let(:quote) { obj.instance_variable_get(:@quote) }
  let(:author) { obj.instance_variable_get(:@author) }

  describe '#initialize' do
    it 'should initialize a quote with a quote' do
      expect(quote).to be_a(String)
    end

    it 'should initialize an author with the authors name' do
      expect(author).to be_a(String)
    end
  end
end
