require 'test/unit'
require_relative '../comparison'

class TestComparison < Test::Unit::TestCase
  def test_separation
    termone = 5
    termtwo = 25
    expected = Comparison.separation(termone, termtwo)
    assert_equal expected, 20
  end

  def test_is_text?
    file_pass = 'blaaaargh.txt'
    file_false = 'blaaaargh.jar'
    expected_pass = Comparison.is_text?(file_pass)
    expected_false = Comparison.is_text?(file_false)
    assert_equal expected_pass, true
    assert_equal expected_false, false
  end
end
