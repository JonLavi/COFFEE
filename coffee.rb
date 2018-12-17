require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/producers_controller')
require_relative('controllers/products_controller')

get '/' do
  erb( :index )
end
