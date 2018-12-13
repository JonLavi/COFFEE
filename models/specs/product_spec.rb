require('minitest/autorun')
require('minitest/rg')
require_relative('../product')

class ProductTest < MiniTest::Test

  def setup
    options = {name:"Colombian Supremo", producer_id:1, origin:"Colombia", roast:"Dark"}
    @product1 = Product.new(options)
  end

  def test_product_name
    assert_equal("Colombian Supremo",@product1.name)
  end

  def test_product_producer_id
    assert_equal(1, @product1.producer_id)
  end

  def test_product_origin
    assert_equal("Colombia", @product1.origin)
  end

  def test_product_roast
    assert_equal("Dark", @product1.roast)
  end

end
