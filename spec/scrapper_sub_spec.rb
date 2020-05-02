# frozen_string_literal: true

require_relative '../liv/scrapper_subj'

describe Scrapper do
  let (:scrapper) { Scrapper.new }
  let (:doc) { scrapper.instance_variable_get(:@doc) }
  describe '#get_text' do
    it 'should accept an index as an argument' do
      expect { scrapper.get_text(1) }.to_not raise_error
    end

    it 'should return a string containing a valid link' do
      expect(scrapper.get_text).to be_a(String)
    end
  end

  describe '#get_link' do
    it 'should accept an index as an argument' do
      expect { scrapper.get_text(1) }.to_not raise_error
    end

    it 'should return a string containing a valid link' do
      expect(scrapper.get_text).to include?('www')
    end
  end
end
