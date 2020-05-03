# frozen_string_literal: true

require_relative '../lib/store'

describe StoreScrapper do
  let(:store) { StoreScrapper.new }
  let(:doc) { store.instance_variable_get(:@doc) }

  describe '#initialize' do
    it 'should initialize a doc as a nokogiri object' do
      expect(doc).to be_a(Nokogiri::HTML::Document)
    end
  end

  describe '#product_title' do
    it 'should accept an index as an argument' do
      expect { store.product_title(1) }.to_not raise_error
    end

    it 'should return a string containing the title of the product' do
      expect(store.product_title(1)).to be_a(String)
    end
  end

  describe '#product_link' do
    it 'should accept an index as an argument' do
      expect { store.product_title(1) }.to_not raise_error
    end

    it 'should return a string containing the link to the product' do
      expect(store.product_link(1)).to be_a(String)
    end
  end
end
