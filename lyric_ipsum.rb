require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/make_ipsum.rb'

get '/' do
  "Hello World"

  erb :hello
end

post '/result' do
  @result = []

  # Takes the number of paragraphs the user passes in
  # and the artist & song title to create a new song object
  params[:paragraphs].to_i.times do
    @new_song = Ipsum::Song.new(params[:artist], params[:song])
    
    # If the song does not exist in either database 
    # (either because of a misspelling or 
    # because the song really isn't there), sets @no_song
    @no_song = true if @new_song.no_song?

    # checks to see if user has requested Latin with their lyric filler
    params[:latin] == "latin-on" ? @latin = true : @latin = false
    
    # Adds a new paragraph of text to the @results array
    @result << @new_song.random_lines(@latin)
  end

  # Adds Latin
  @result[0].insert(0, "Lorem ipsum dolor sit amet. ") if @latin

  # Joins paragraphs together with line breaks
  @result = @result.join(".<br><br>")

  erb :result
end
