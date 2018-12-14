require('minitest/autorun')
require('minitest/rg')
require_relative('../item_stock')

class ItemStockTest < MiniTest::Test

  def setup
    options = {product_id: 1}
    @itemstock1 = ItemStock.new(options)
  end

  def test_item_stock_product_id
    assert_equal(1, @itemstock1.product_id)
  end

end
