require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'lyricfy'
require 'gracenote'

module Ipsum

  attr_reader :no_song, :searcher

  class Song
    RICKROLL_LINES = ["We're no strangers to love",
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

    LATIN = ["Consectetur adipiscing elit",
      "Aliquam volutpat urna turpis",
      "Fringilla elementum mauris venenatis ac",
      "Sed ac massa fringilla",
      "Porttitor augue eget",
      "Pulvinar augue",
      "Mauris felis ligula",
      "Adipiscing in tellus vel",
      "Condimentum tempus lacus",
      "Nullam id est nec mauris",
      "Sollicitudin molestie eu a tortor",
      "Sed egestas pretium nibh",
      "At vulputate lectus consequat in",
      "Integer adipiscing",
      "Lectus ut tincidunt accumsan",
      "Lorem odio ultrices elit",
      "Condimentum sollicitudin",
      "Odio orci eu eros",
      "In iaculis lorem eu mollis accumsan",
      "Nullam at molestie dui",
      "Donec commodo metus sed turpis",
      "Convallis pellentesque",
      "Aliquam ac ullamcorper libero",
      "Ut gravida leo at tellus mollis aliquet",
      "In vitae purus sagittis lectus",
      "Convallis fringilla ac id dolor",
      "Nulla facilisi",
      "In aliquet accumsan nunc",
      "At vulputate lectus pharetra luctus",
      "Sed faucibus molestie magna",
      "Et blandit turpis sagittis ut",
      "Quisque dictum bibendum orci",
      "At sodales diam suscipit vel",
      "Interdum et malesuada fames", 
      "ac ante ipsum primis in faucibus", 
      "Sed justo nisi", 
      "lacinia nec porttitor nec",
      "tincidunt sed nisi", 
      "Duis nec tincidunt urna", 
      "Integer pharetra odio vitae nibh viverra", 
      "sit amet malesuada lectus tempus", 
      "Vestibulum felis lacus", 
      "ullamcorper ut molestie vitae", 
      "feugiat a libero",
      "Duis rutrum erat vel faucibus porttitor", 
      "Fusce at nulla vel lacus pulvinar commodo", 
      "Mauris at faucibus metus", 
      "Curabitur fringilla diam a tortor elementum", 
      "ut ornare magna tincidunt", 
      "Praesent vulputate lorem", 
      "sed mauris volutpat dignissim", 
      "Phasellus ut nulla non diam", 
      "ornare aliquet gravida sed erat", 
      "Mauris tempus sagittis metus", 
      "porttitor viverra odio tristique ac", 
      "Fusce pulvinar elit orci", 
      "ut tincidunt leo pulvinar eget",
      "Fusce condimentum neque et", 
      "odio condimentum aliquam", 
      "Aenean volutpat ipsum eu", 
      "massa laoreet convallis", 
      "Nam lacinia erat magna", 
      "vitae porta augue sodales eu", 
      "Aliquam sit amet bibendum dolor", 
      "Nunc dignissim neque vel magna posuere scelerisque", 
      "Morbi condimentum risus et tempor vehicula", 
      "Nunc pretium ligula et justo ullamcorper", 
      "id hendrerit urna ultrices", 
      "Quisque lobortis arcu nec porta ultricies", 
      "Vivamus ut tortor ac tellus imperdiet malesuada"]

    attr_reader :title, :author, :lines, :no_song

    def initialize(artist, song)
      fetcher = Lyricfy::Fetcher.new

      if song = fetcher.search(artist, song)
        @lines = song.lines
      elsif 
        @searcher.search_gracenote
      else
        @lines = RICKROLL_LINES
        @no_song = true
      end
    end

    def no_song?
      @no_song
    end

    def random_lines(latin)
      number_of_lines = rand(10..15)
      song_lines = @lines.sample(number_of_lines)

      if latin
        rand(6..12).times do
          latin_line = LATIN.sample
          song_lines.insert(rand(number_of_lines), latin_line)
          number_of_lines += 1
        end
      end

      song_lines.join(". ")
    end

    def search_gracenote(artist)
      spec = {:clientID => "15732736-D6D55495C2F42833A48C776AE77E90F0", :clientTag => "D6D55495C2F42833A48C776AE77E90F0"}
      obj = Gracenote.new(spec)
      obj.registerUser

      @searcher = findArtist(artist, matchMode=@@BEST_MATCH_ONLY)
    end

  end
end
