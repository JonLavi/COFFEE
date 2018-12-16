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
get '/products/new' do
  @producers = Producer.all
  erb(:'products/new')
end

post '/products' do
  product = Product.new(params)
  product.save()
  redirect to("/products")
end

#Show Product details
get '/products/:id' do
  @product = Product.find(params['id'].to_i)
  erb(:'products/show')
end

#Edit Product details
get '/products/:id/edit' do
  @product = Product.find(params['id'].to_i)
  erb(:'products/edit')
end

post '/products/:id' do
  @product = Producer.new(params)
  @product.update()
  erb(:'products/show')
end

#Delete Product route
