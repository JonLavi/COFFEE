require('minitest/autorun')
require('minitest/rg')
require_relative('../origin')
require_relative('../product')

class OriginTest < MiniTest::Test

  def test_origin_name
    origin = Origin.new({'name' => 'Kenya'})
    assert_equal('Kenya', origin.name)
  end

end
