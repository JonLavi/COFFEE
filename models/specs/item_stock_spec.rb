require('minitest/autorun')
require('minitest/rg')
require_relative('../item_stock')
require_relative('../product')

class ItemStockTest < MiniTest::Test

  def setup
    product_options = {name:"Colombian Supremo", producer_id:1, origin:"Colombia", roast:"Dark", blend:"Arabica", type: "Whole Bean", weight: 500}
    @product1 = Product.new(product_options)
    options = {product_id: 1, product_name: @product1.name, units_in_stock: 10, optimal_stock: 20}
    @itemstock1 = ItemStock.new(options)
  end

  def test_item_stock_product_id
    assert_equal(1, @itemstock1.product_id)
  end

  def test_item_stock_product_name
    assert_equal("Colombian Supremo", @itemstock1.product_name)
  end

  def test_item_stock_units_in_stock
    assert_equal(10, @itemstock1.units_in_stock)
  end

  def test_item_stock_optimal_stock
    assert_equal(20, @itemstock1.optimal_stock)
  end

end
