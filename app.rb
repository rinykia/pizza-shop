require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
  @products = Product.all
  erb :index

end

get '/about' do 
  erb :about
end

get '/admin' do
  @orders = Order.all.order('created_at DESC')
  erb :admin
end

post '/place_order' do 
  @order = Order.create params[:order]
  erb :order_placed
end

post '/cart' do 
  #list parameters and parse(assort) it 
  @orders_input = params[:orders]
  @items = parse_orders_input @orders_input

  # output message cart is empty
  if @items.length == 0
    return erb :cart_is_empty
  end

  #outpyt index products in cart

  @items.each do |item|
    # id, cnt
    item[0] = Product.find(item[0])
  end
  # defolt view
  erb :cart
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

def parse_orders_input orders_input
  s1 = orders_input.split(/,/)

  arr = []

  s1.each do |x|
    s2 = x.split(/\=/)
    s3 = s2[0].split(/_/)
    id = s3[1]
    cnt = s2[1]

    arr2 = [id, cnt]

    arr.push arr2
  end
  return arr
end

