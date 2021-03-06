require 'helper'

class Arelastic::Mappings::BinaryTest < MiniTest::Unit::TestCase
  def test_as_elastic
    type = Arelastic::Mappings::Binary.new('message', 'index' => 'analyzed')
    expected = {'message' => {'type' => 'binary', 'index' => 'analyzed'}}

    assert_equal expected, type.as_elastic
  end
end