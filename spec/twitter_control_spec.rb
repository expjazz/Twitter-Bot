# frozen_string_literal: true

require_relative '../lib/twitter_control'

describe TwitterControl do
  let(:obj) { TwitterControl.new }
  let(:followers_list) { obj.instance_variable_get(:@followers_list) }
  let(:f_count) { obj.instance_variable_get(:@f_count) }
  describe '#initialize' do
    it 'should initialize a list containg all followers from the users account' do
      expect(obj.followers_list).to be_an(Array)
    end

    it 'should initialize a count of followers' do
      expect(obj.f_count).to be_a(Integer)
    end
  end

  describe '#post' do
    it 'should accept a post and a time as an argument to tweet it' do
      expect { obj.post('post', 20) }.to_not raise_error
    end

    it 'should raise error if the lenght of the post is greater than 280 chars' do
      post = 'Character Count & Word Count Tool is a free character counter
      tool that provides instant character count &
       word count statistics for a given text.
       The tool reports the number of character
       with spaces and without spaces, also the
       number of words and sentences... Character
       Count Tool monitors and reports the character
       counts & word counts of the text that you type in real time.
       Thus it is suitable for writing text with word/ character limit.'
      expect { obj.post(post, 20) }.to raise_error
    end
  end

  describe '#follow' do
    it 'should accept an user as an argument' do
      expect { obj.follow(id) }.to_not raise_error
    end
    it 'should follow a given user and return its user profile' do
      expect follow(id).to be_an(Twitter::User)
    end
  end

  describe '#get_tweet_content' do
    it 'should accept a hashtag as an argument' do
      expect { obj.get_tweet_content('#abc') }.to_not raise_error
    end
  end

  describe '#tweet_content_to_csv' do
    it 'should call get_tweet_content' do
      expect(obj.tweet_content_to_csv).to receive(:get_tweet_content)
    end
  end
end
