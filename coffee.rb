require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/producers_controller')
require_relative('controllers/products_controller')
require_relative('controllers/settings_controller')

get '/' do
  @products = Product.all
  erb( :index )
end
