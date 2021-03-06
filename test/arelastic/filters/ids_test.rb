require 'helper'

class Arelastic::Filters::IdsTest < MiniTest::Unit::TestCase
  def test_as_elastic
    expected = {"ids" => {"values" => ["foo", "bar"]}}

    assert_equal expected, Arelastic::Filters::Ids.new(['foo', 'bar']).as_elastic
  end
end