
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../lib/make-ipsum.rb'

describe Ipsum::Song do 

  describe '#initialize' do
    context 'when song exists as entered' do 
      it 'fetches the song the user requests from the Lyricfy API' do
        expect(@new_song).to be_a(Lyricfy::Fetcher::fetcher.search)
      end
    end

    # context 'when song does not exist as entered' do 
    #   it 'returns error text and a rickroll' do
    #     expect().to be_a()
    #   end
    # end
  end
  
end 