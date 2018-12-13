require('minitest/autorun')
require('minitest/rg')
require_relative('../producer')

class ProducerTest < MiniTest::Test

  def test_producer()
    producer1 = Producer.new("YummyCoffeeCo","123 Fake Street")
    assert_equal("YummyCoffeeCo",producer1.name)
  end

  def test_producer_address()
    producer1 = Producer.new("YummyCoffeeCo","123 Fake Street")
    assert_equal("123 Fake Street",producer1.address)
  end
end
