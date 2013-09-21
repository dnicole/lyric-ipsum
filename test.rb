require "lyricfy"

fetcher = Lyricfy::Fetcher.new
song = fetcher.search(artist, song)
puts song.body