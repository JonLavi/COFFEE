require_relative('../models/producer')
require_relative('../models/product')
require_relative('../models/stock_item')
require('pry')

producer1 = Producer.new({
  name: "YummyCoffeeCo",
  address: "123 Fake Street"
 })

producer1.save()

product1 = Product.new({name:"Colombian Supremo",
           producer_id:1,
           origin:"Colombia",
           roast:"Dark",
           blend:"Arabica",
           type: "Whole Bean",
           weight: 500,
           unit_cost: 5,
           sell_price: 6,
         })
product1.save()
