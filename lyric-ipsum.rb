require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' 

get '/' do
  "Hello World"

  erb :hello
end

post '/' do
  @band = Ipsum::Band.new(params['band'])
  @album = Ipsum::Album.new(params['album'])

  erb :result
end