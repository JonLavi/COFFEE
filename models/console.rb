require('pry')
require_relative('producer')
require_relative('product')
require_relative('stock_item')

StockItem.delete_all()
Product.delete_all()
Producer.delete_all()

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
           'origin' => 'Colombia',
           'roast' => 'Dark',
           'blend' => 'Arabica',
           'type' => 'Whole Bean',
           'weight' => 500,
           'unit_cost' => 5,
           'sell_price' => 6,
         })
product1.save()

product2 = Product.new({'name' => 'Kickass Kenyan',
           'producer_id' => producer2.id,
           'origin' =>'Kenya',
           'roast' =>'Medium',
           'blend' =>'Robusta',
           'type' => 'Medium Coarse',
           'weight' => 500,
           'unit_cost' => 4,
           'sell_price' => 5,})
product2.save()

stockitem1 = StockItem.new({'product_id' => product1.id,
           'product_name' => product1.name,
           'units_in_stock' => 10,
           'optimal_stock' => 20})
stockitem1.save()

stockitem2 = StockItem.new({'product_id' => product2.id,
           'product_name' => product2.name,
           'units_in_stock' => 15,
           'optimal_stock' => 30})
stockitem2.save()

stockitem1.stock_buy_value

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

binding.pry
nil
