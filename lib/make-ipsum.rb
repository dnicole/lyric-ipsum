require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'lyricfy'

module Ipsum
  attr_reader :no_song

  class Song

    def initialize(artist, song)
      fetcher = Lyricfy::Fetcher.new
      @new_song = fetcher.search(artist, song)
      if @new_song == nil
        @new_song = fetcher.search("Rick Astley", "Never Gonna Give You Up")
        @no_song = true
      end
    end

    def no_song?
      @no_song
    end

    def lyrics
      @new_song.lines.sample(rand(10..15)).join(". ")
    end
  end
end

