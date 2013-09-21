
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../lib/make-ipsum.rb'

describe Ipsum::Song do 

  describe '#initialize' do
    it 'returns the song the user asks for from the Lyricfy API' do
      expect(self).to be_a(Lyricfy::Fetcher)
    end
  end
  
end 