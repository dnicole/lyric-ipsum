require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'lyricfy'

module Ipsum

  class Song
    def initialize(artist, song)
      fetcher = Lyricfy::Fetcher.new
      @new_song = fetcher.search(artist, song)
    end

    # def lines
    #   self["lines"]
    # end

    def lyrics
      @new_song.lines.sample(2)
    end
  end

  # class
  # end
end

# fetcher = Lyricfy::Fetcher.new
# song = fetcher.search 'Artist', 'Song'
# puts song.body # prints lyrics separated by '\n'
