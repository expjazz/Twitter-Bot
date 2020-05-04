require_relative '../lib/twitter_control'

describe TwitterControl do
  let(:obj) { TwitterControl.new }
  let(:followers_list) { obj.instance_variable_get(:@followers_list) }
  let(:f_count) { obj.instance_variable_get(:@f_count) }
  let(:id) { 2_842_991_291 }

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
  end

  describe '#get_tweet_content' do
    it 'should accept a hashtag as an argument' do
      expect { obj.get_tweet_content('#abc') }.to_not raise_error
    end
  end

  describe '#catch_new_followers' do
    it 'should return a list of profiles to send direct messages' do
      expect(obj.catch_new_followers).to be_an(Array)
    end
  end

  describe '#dm_new_follower' do
    it 'should return a updated list of the followers' do
      expect(obj.dm_new_follower).to be_an(Array)
    end
  end
end
