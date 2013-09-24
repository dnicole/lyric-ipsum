require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'lyricfy'

module Ipsum
  attr_reader :no_song


  class Song
    RICKROLL_LINES = ["Oooh",
      "We're no strangers to love",
      "You know the rules and so do I",
      "A full commitment's what I'm thinking of",
      "You wouldn't get this from any other guy",
      "I just wanna tell you how I'm feeling",
      "Gotta make you understand",
      "Never gonna give you up",
      "Never gonna let you down",
      "Never gonna run around and desert you",
      "Never gonna make you cry",
      "Never gonna say goodbye",
      "Never gonna tell a lie and hurt you"]

    LATIN = ["Lorem ipsum dolor sit amet", 
      "consectetur adipiscing elit.", 
      "Aliquam volutpat urna turpis.", 
      "fringilla elementum mauris venenatis ac.", 
      "Sed ac massa fringilla", "porttitor augue eget", 
      "pulvinar augue.", "Mauris felis ligula,", 
      "adipiscing in tellus vel,", 
      "condimentum tempus lacus.", 
      "Nullam id est nec mauris", 
      "sollicitudin molestie eu a tortor.", 
      "Sed egestas pretium nibh,", 
      "at vulputate lectus consequat in.",  
      "Integer adipiscing,", 
      "lectus ut tincidunt accumsan,", 
      "lorem odio ultrices elit,", 
      "condimentum sollicitudin", 
      "odio orci eu eros.", 
      "In iaculis lorem eu mollis accumsan.", 
      "Nullam at molestie dui.", 
      "Donec commodo metus sed turpis", 
      "convallis pellentesque.", 
      "Aliquam ac ullamcorper libero."]  

    attr_reader :title, :author, :lines, :no_song 

    def initialize(artist, song)
      fetcher = Lyricfy::Fetcher.new

      if song = fetcher.search(artist, song)
        @lines = song.lines
      else
        @lines = RICKROLL_LINES
        @no_song = true
      end
    end

    def no_song?
      @no_song
    end

    def random_lines
      @lines.sample(rand(10..15)).join(". ")
    end

    def latin_add
      @lines.sample(rand(10..15)).zip(LATIN).flatten.compact.join(". ")
    end
  end
end