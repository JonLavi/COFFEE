require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/stock_item')
also_reload('./models/*')


#show all stock items route
#details of stock item route
#new stock item route
#edit stock items route
#delete stock items route
