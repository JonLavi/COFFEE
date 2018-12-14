require('pry')
require_relative('producer')
require_relative('product')
require_relative('stock_item')

Producer.all()
Product.all()
StockItem.all()

binding.pry
nil
