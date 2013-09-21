require 'rubygems'
require 'bundler/setup'
require 'songmeanings'
require 'pry'
require 'unirest'
require 'lyricfy'

module Ipsum

class Band
  attr_reader :fetcher

  def initialize("band")
    @fetcher = Lyricfy::Fetcher.new
  end
end

class Song
  attr_reader :song

  def initialize
    @song = Band.fetcher.search
  end
end

end

fetcher = Lyricfy::Fetcher.new
song = fetcher.search 'Coldplay', 'Viva la vida'
puts song.body # prints lyrics separated by '\n'
