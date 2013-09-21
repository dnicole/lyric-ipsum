require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' 

get '/' do
  "Hello World"

  erb :hello
end