require_relative('../models/producer')
require_relative('../models/product')
require('pry')

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
           'units_in_stock' => 10,
           'optimal_stock' => 20
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
           'sell_price' => 5,
           'units_in_stock' => 15,
           'optimal_stock' => 30})
product2.save()
