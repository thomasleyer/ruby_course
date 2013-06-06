#!/usr/bin/env ruby
require "sinatra"


get '/' do
	"Willkommen"
end

get '/test' do
	"Hallo Test"
end

post '/login' do
	"Willkommen #{params[:name]}"
end

get '/test2' do
	if params[:name]
		"Hallo #{params[:name]}"
	else
		"Hallo"
	end
end

get '/test3' do
	@name = params[:name]
	erb :test
end
