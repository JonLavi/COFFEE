require('minitest/autorun')
require('minitest/rg')
require_relative('../blend')
require_relative('../product')

class BlendTest < MiniTest::Test

  def test_blend_name
    blend = Blend.new({'name' => 'Arabica'})
    assert_equal('Arabica', blend.name)
  end

end
