require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/producers_controller')
require_relative('controllers/products_controller')
require_relative('controllers/stock_items_controller')

get '/' do
  erb( :index )
end
