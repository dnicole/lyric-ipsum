require 'rubygems'
require 'bundler/setup'
require 'songmeanings'
require 'pry'
require 'unirest'
require 'lyricfy'

module Ipsum
  fetcher = Lyricfy::Fetcher.new

  class Lyric
    def initialize(artist, song)
      @song = fetcher.search(artist, song)
    end
  end 
end

# fetcher = Lyricfy::Fetcher.new
# song = fetcher.search 'Artist', 'Song'
# puts song.body # prints lyrics separated by '\n'
