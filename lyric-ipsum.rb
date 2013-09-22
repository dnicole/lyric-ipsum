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
  @result = Ipsum::Song.new(params[:artist], params[:song]).lyrics

  erb :result
end
