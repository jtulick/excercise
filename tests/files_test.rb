require 'test/unit'
require_relative '../files'
require_relative '../comparison'

class TestFiles < Test::Unit::TestCase
  def test_initalize
    new_file_one = Files.new('Lorem_test.txt', './tests/Lorem_test.txt')
    assert_equal new_file_one.name, 'Lorem_test.txt'
    assert_equal new_file_one.full_path, './tests/Lorem_test.txt'
    assert_equal new_file_one.has_context, false
  end

  def test_find_words?
    new_file_one = Files.new('Lorem_test.txt', './tests/Lorem_test.txt')
    new_file_two = Files.new('Lorem_test_fail.txt', './tests/Lorem_test_fail.txt')
    test_files = [new_file_one, new_file_two]
    test_files.each do |file|
      file.find_words?('testing', 'context')
    end
    assert_equal new_file_one.term_one_locations.size, 64
    assert_equal new_file_one.term_two_locations.size, 44
    assert_equal new_file_two.term_one_locations.size, 0
    assert_equal new_file_two.term_two_locations.size, 0
  end

  def test_set_context
    new_file_one = Files.new('Lorem_test.txt', './tests/Lorem_test.txt')
    new_file_two = Files.new('Lorem_test_fail.txt', './tests/Lorem_test_fail.txt')
    test_files = [new_file_one, new_file_two]
    context = 25
    test_files.each do |file|
      file.find_words?('testing', 'context')
    end
    test_files.each do |file|
      file.set_context(context)
    end
    assert_equal new_file_one.has_context, true
    assert_equal new_file_two.has_context, false
  end
end
