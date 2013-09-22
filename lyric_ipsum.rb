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

  params[:paragraphs].to_i.times do
    @new_song = Ipsum::Song.new(params[:artist], params[:song])
    @no_song = true if @new_song.no_song?
    @result << @new_song.random_lines
  end

  @result = @result.join(".<br><br>")

  erb :result
end
