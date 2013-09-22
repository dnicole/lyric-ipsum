require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/make-ipsum.rb'

get '/' do
  "Hello World"

  erb :hello
end

post '/result' do
  @result = []

  params[:paragraphs].to_i.times do
    @result << Ipsum::Song.new(params[:artist], params[:song]).lyrics
  end

  @result = @result.join(".<br><br>")

  erb :result
end
