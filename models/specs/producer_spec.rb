require('minitest/autorun')
require('minitest/rg')
require_relative('../producer')

class ProducerTest < MiniTest::Test

  def test_producer()
    producer1 = Producer.new("YummyCoffeeCo")
    assert_equal("YummyCoffeeCo",producer1.name)
  end

end
