require('minitest/autorun')
require('minitest/rg')
require_relative('../stock_item')
require_relative('../product')

class StockItemTest < MiniTest::Test

  def setup
    product1_options = {'name' => 'Colombian Supremo',
               'producer_id' => 1,
               'origin' => 'Colombia',
               'roast' => 'Dark',
               'blend' => 'Arabica',
               'type' => 'Whole Bean',
               'weight' => 500,
               'unit_cost' => 5,
               'sell_price' => 6,
             }
    @product1 = Product.new(product1_options)

    options = {'product_id' => 1,
               'product_name' => @product1.name,
               'units_in_stock' => 10,
               'optimal_stock' => 20}
    @stockitem1 = StockItem.new(options)
  end

  def test_stock_item_product_id
    assert_equal(1, @stockitem1.product_id)
  end

  def test_stock_item_product_name
    assert_equal('Colombian Supremo', @stockitem1.product_name)
  end

  def test_stock_item_units_in_stock
    assert_equal(10, @stockitem1.units_in_stock)
  end

  def test_stock_item_optimal_stock
    assert_equal(20, @stockitem1.optimal_stock)
  end

end
