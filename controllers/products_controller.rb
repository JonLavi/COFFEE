require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/product')
also_reload('./models/*')


#Show all Products
get '/products' do
  @products = Product.all
  erb(:'products/index')
end

#Create Product route


#Show Product details
get '/products/:id' do
  @product = Product.find(params['id'].to_i)
  erb(:'products/show')
end


#Edit Product details
#Delete Product route
