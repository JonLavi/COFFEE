require('minitest/autorun')
require('minitest/rg')
require_relative('../roast')
require_relative('../product')

class RoastTest < MiniTest::Test

  def test_roast_name
    roast = Roast.new({'name' => 'Dark'})
    assert_equal('Dark', roast.name)
  end

end
