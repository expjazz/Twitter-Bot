# frozen_string_literal: true

require_relative '../lib/scrapper_subj'

describe Scrapper do
  let (:scrapper) { Scrapper.new('testing') }
  let (:doc) { scrapper.instance_variable_get(:@doc) }

  describe '#initialize' do
    it 'should accept a subject as an argument' do
      expect { Scrapper.new('testing') }.to_not raise_error
    end

    it 'should initialize a doc with an nokogiri object' do
      expect(scrapper.doc).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe '#get_text' do
    it 'should accept an index as an argument' do
      expect { scrapper.get_text(1) }.to_not raise_error
    end

    it 'should return a string containing a valid link' do
      expect(scrapper.get_text(1)).to be_a(String)
    end
  end

  describe '#get_link' do
    it 'should accept an index as an argument' do
      expect { scrapper.get_link(1) }.to_not raise_error
    end

    it 'should return a string containing a valid link' do
      expect(scrapper.get_link(1)).to include('www')
    end
  end
end
