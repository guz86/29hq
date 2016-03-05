#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.order "created_at DESC"
end

get '/' do
	@barbers = Barber.order "created_at DESC"
	erb :index		
end

get '/visit' do
	erb :visit 
end

post '/visit' do 
	@name = params[:name]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
    @color = params[:color]


# передача данных
    c = Client.new
    c.name = @name
    c.phone = @phone
    c.datestamp = @datestamp
    c.barber = @barber
    c.color = @color
    c.save

	erb "<h2>Thank you! Dear, #{@name} we'll be waiting for you at #{@datetime} Your barber:#{@barber}! Your color: #{@color}</h2>"
end
