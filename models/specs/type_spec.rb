require('minitest/autorun')
require('minitest/rg')
require_relative('../type')
require_relative('../product')

class TypeTest < MiniTest::Test

  def test_type_name
    type = Type.new({'name' => 'Espresso'})
    assert_equal('Espresso', type.name)
  end

end
