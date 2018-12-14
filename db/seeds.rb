require_relative('../models/producer')
require_relative('../models/product')
require_relative('../models/stock_item')
require('pry')

producer1 = Producer.new({
  name: "YummyCoffeeCo",
  address: "123 Fake Street"
 })

producer1.save()
