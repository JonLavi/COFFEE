require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/producer')
require_relative('../models/product')
also_reload('./models/*')

#Show all Products
get '/products' do
  @products = Product.all
  erb(:'products/index')
end

#Show all Products by producer
get '/products/producer/:id' do
  @producer = Producer.find(params['id'].to_i)
  @products = Product.all
  erb(:'products/filter')
end

#Create Product route
get '/products/new' do
  @producers = Producer.all
  @origins = Origin.all
  @blends = Blend.all
  @roasts = Roast.all
  @types = Type.all
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
  @producers = Producer.all
  @origins = Origin.all
  @blends = Blend.all
  @roasts = Roast.all
  @types = Type.all
  erb(:'products/edit')
end

post '/products/:id/inline' do
  product = Product.new(params)
  product.update
  redirect to("/products")
end

post '/products/:id' do
  product = Product.new(params)
  product.update
  redirect to "/products/#{params['id']}"
end

#Delete Product route
get '/products/:id/delete' do
  Product.delete_by_id(params['id'].to_i)
  redirect to("/products")
end
