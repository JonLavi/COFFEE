require('minitest/autorun')
require('minitest/rg')
require_relative('../product')

class ProductTest < MiniTest::Test

  def test_product_name
    product1 = Product.new({name:"Colombian Supreme"})
    assert_equal("Colombian Supreme",product1.name)
  end

end
