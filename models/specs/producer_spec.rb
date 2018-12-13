require('minitest/autorun')
require('minitest/rg')
require_relative('../producer')

class ProducerTest < MiniTest::Test

  def setup()
    options1 = {name: "YummyCoffeeCo", address: "123 Fake Street", products: []}
    @producer1 = Producer.new(options1)
  end

  def test_producer()
    assert_equal("YummyCoffeeCo",@producer1.name)
  end

  def test_producer_address()
    assert_equal("123 Fake Street",@producer1.address)
  end

  def test_producer_products()
    assert_equal([],@producer1.products)
  end


end
