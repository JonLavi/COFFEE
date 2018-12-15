require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/product')
also_reload('./models/*')


#Show all Products
get '/products' do
  @products = Producer.all
  erb(:'products/index')
end



#Create Product route
#Show Product details
#Edit Product details
#Delete Product route
