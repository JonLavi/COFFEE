require('minitest/autorun')
require('minitest/rg')
require_relative('../product')

class ProductTest < MiniTest::Test

  def setup
    options = {name:"Colombian Supremo", producer_id:1}
    @product1 = Product.new(options)
  end

  def test_product_name
    assert_equal("Colombian Supremo",@product1.name)
  end

  def test_product_producer_id
    assert_equal(1, @product1.producer_id)
  end

end
