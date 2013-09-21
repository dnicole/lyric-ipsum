require 'rubygems'
require 'bundler/setup'
# require 'pry'
require 'lyricfy'

module Ipsum
  fetcher = Lyricfy::Fetcher.new

  class Song
    def initialize(artist, song)
      @song = fetcher.search(artist, song)
    end

    def lyrics
      @song.lines.sample
    end
  end

  # class 
  # end 
end

# fetcher = Lyricfy::Fetcher.new
# song = fetcher.search 'Artist', 'Song'
# puts song.body # prints lyrics separated by '\n'
