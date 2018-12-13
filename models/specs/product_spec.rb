require('minitest/autorun')
require('minitest/rg')
require_relative('../product')

class ProductTest < MiniTest::Test

  def setup
    options = {name:"Colombian Supremo", producer_id:1, origin:"Colombia", roast:"Dark", blend: "Pure Arabica", grind: "fine"}
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

  def test_product_blend
    assert_equal("Pure Arabica", @product1.blend)
  end

  def test_product_grind
    assert_equal("fine", @product1.grind)
  end

end
