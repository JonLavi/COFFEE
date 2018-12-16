require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/stock_item')
also_reload('./models/*')


#Show all stock items route

get '/stock_items' do
  @stock_items = StockItem.all
  erb(:'stock_items/index')
end

#Create Stock Item route

get '/stock_items/new' do
  @products = Product.all
  @stock_item = StockItem.all
  erb(:'stock_items/new')
end

post '/stock_items' do
  stock_item = StockItem.new(params)
  stock_item.save()
  redirect to('/stock_items')
end

#Show Stock Item details

get '/stock_items/:id' do
  @stock_item = StockItem.find(params['id'].to_i)
  erb(:'stock_items/show')
end


#edit stock items route
#delete stock items route
