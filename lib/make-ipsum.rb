require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'lyricfy'

module Ipsum

  class Song
    def initialize(artist, song)
      fetcher = Lyricfy::Fetcher.new
      fetcher.search(artist, song)
    end

    def lyrics
      self.lines.sample
    end
  end

  # class 
  # end 
end

# fetcher = Lyricfy::Fetcher.new
# song = fetcher.search 'Artist', 'Song'
# puts song.body # prints lyrics separated by '\n'
