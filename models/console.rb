# require('pry')
require_relative('producer')
require_relative('product')
require_relative('blend')
require_relative('origin')
require_relative('roast')
require_relative('type')

Product.delete_all()
Producer.delete_all()

blend1 = Blend.new({'name' => 'Arabica'})
blend1.save()
blend2 = Blend.new({'name' => 'Robusta'})
blend2.save()

origin1 = Origin.new({'name' => 'Kenya'})
origin1.save()
origin2 = Origin.new({'name' => 'Columbia'})
origin2.save()

roast1 = Roast.new({'name' => 'Dark'})
roast1.save()
roast2 = Roast.new({'name' => 'Medium'})
roast2.save()

type1 = Type.new({'name' => 'Espresso'})
type1.save()
type2 = Type.new({'name' => 'Filter'})
type2.save()

producer1 = Producer.new({
  'name' => 'YummyCoffeeCo',
  'address' => '123 Fake Street'})
producer1.save()

producer2 = Producer.new({
  'name' => 'WiredBrew',
  'address' => '456 Fake Street'})
producer2.save()

product1 = Product.new({'name' => 'Colombian Supremo',
           'producer_id' => producer1.id,
           'origin' => origin2.id,
           'roast' => roast2.id,
           'blend' => blend2.id,
           'type' => type2.id,
           'weight' => 500,
           'unit_cost' => 5,
           'sell_price' => 6,
           'units_in_stock' => 10,
           'optimal_stock' => 20
         })
product1.save()

product2 = Product.new({'name' => 'Kickass Kenyan',
           'producer_id' => producer2.id,
           'origin' => origin1.id,
           'roast' => roast1.id,
           'blend' => blend1.id,
           'type' => type1.id,
           'weight' => 500,
           'unit_cost' => 4,
           'sell_price' => 5,
           'units_in_stock' => 15,
           'optimal_stock' => 30
           })
product2.save()



##### Tested Methods: #####
# product1.name = "ColomboCoffee"
# product1.blend = "Robusta"
# product1.update()

# producer1.name = "Hot Stuff Coffee"
# producer1.address = "1 Elm Street"
# producer1.update()

# Producer.all()
# Product.all()
# StockItem.all()
# Producer.find(22)
# Product.find(22)
# StockItem.find(7)

# list_of_products =[product1, product2]
# Product.total_stock_buy_value(list_of_products)
# Product.total_stock_sell_value(list_of_products)
# Product.total_stock_profit(list_of_products)

# binding.pry
# nil
