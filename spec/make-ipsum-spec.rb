
require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../lib/make-ipsum.rb'

describe Ipsum::Song do 

  describe '#initialize' do
    context 'when song exists as entered' do
      it 'returns the song object with the correct lyrics' do
        song = double("song")
        song.stub(:lines).and_return(['lyrics'])
        Lyricfy::Fetcher.stub_chain(:new, :search).and_return(song)

        expect(Ipsum::Song.new('I am trying to break your heart', 'Wilco').lines).to eq(song.lines)
      end
    end

    context 'when the song does not exist' do
      before(:each) do
        Lyricfy::Fetcher.stub_chain(:new, :search).and_return(nil)
      end

      let(:song) { Ipsum::Song.new('no song', 'no artist') }

      it 'Rickrolls' do
        expect(song.lines).to eq(Ipsum::Song::RICKROLL_LINES)
      end

      it 'set @no_song to true' do
        expect(song.no_song).to eq(true)
      end
    end

    # context 'when song does not exist as entered' do 
    #   it 'returns error text and a rickroll' do
    #     expect().to be_a()
    #   end
    # end
  end
  
end 