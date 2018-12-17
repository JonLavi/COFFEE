require('minitest/autorun')
require('minitest/rg')
require_relative('../producer')
require_relative('../product')

class ProducerTest < MiniTest::Test

  def setup()
    options1 = {'name'=> 'YummyCoffeeCo', 'address'=> '123 Fake Street'}
    @producer1 = Producer.new(options1)

    options = {'name' => 'Colombian Supremo',
               'producer_id' => 1,
               'origin' => 'Colombia',
               'roast' => 'Dark',
               'blend' => 'Arabica',
               'type' => 'Whole Bean',
               'weight' => 500,
               'unit_cost' => 5,
               'sell_price' => 6,
               'units_in_stock' => 10,
               'optimal_stock' => 20
             }
    @product1 = Product.new(options)
  end

  def test_producer()
    assert_equal('YummyCoffeeCo',@producer1.name)
  end

  def test_producer_address()
    assert_equal('123 Fake Street',@producer1.address)
  end

end
