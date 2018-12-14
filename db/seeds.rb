require_relative('../models/producer')
require_relative('../models/product')
require_relative('../models/stock_item')
require('pry')

StockItem.delete_all()
Product.delete_all()
Producer.delete_all()

producer1 = Producer.new({
  name: "YummyCoffeeCo",
  address: "123 Fake Street"})

producer1.save()

binding.pry 
product1 = Product.new({name:"Colombian Supremo",
           producer_id: producer1.id,
           origin:"Colombia",
           roast:"Dark",
           blend:"Arabica",
           type: "Whole Bean",
           weight: 500,
           unit_cost: 5,
           sell_price: 6,})

product1.save()

stockitem1 = StockItem.new({product_id: product1.id,
           product_name: product1.name,
           units_in_stock: 10,
           optimal_stock: 20})

stockitem1.save()
