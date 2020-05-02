# frozen_string_literal: true

require_relative '../lib/twitter_control'

describe TwitterControl do
  let(:obj) { TwitterControl.new }
  describe '#post' do
    it 'should accept a post as an argument to tweet it' do
      expect { obj.post('post') }.to_not raise_error
    end
  end
end
