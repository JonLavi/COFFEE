require('pry')
require_relative('producer')
require_relative('product')
require_relative('stock_item')

Producer.all()
Product.all()
StockItem.all()
# Producer.find(22)
# Product.find(22)
# StockItem.find(7)

binding.pry
nil
