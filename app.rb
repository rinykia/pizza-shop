require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end


get '/' do
  @products = Product.all.order('created_at DESC')
  erb :index

end

get '/about' do 
  erb :about
end

post '/new' do
  @p = Product.new params[:product]
  if @p.save
    erb "Product successfully created."
  else
  	@error = @p.errors.full_messages.first
  	erb :new
  end
end

get '/new' do
  @p = Product.new
  erb :new
end
