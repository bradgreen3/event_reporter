require 'minitest/autorun'
require 'minitest/pride'
require './lib/load'

class LoadTest < Minitest::Test

  def test_load_can_be_instantiated
    l = Load.new
    assert_instance_of Load , l
  end

  def test_load_can_import_default_file
    l = Load.new
    l.load_file
    assert_equal 5175 , l.attendees.length
  end

  def test_load_can_import_given_file
    l = Load.new
    l.load_file("event_attendees_small.csv")
    assert_equal 19 , l.attendees.length
  end

  def test_find_by_method_works_with_first_name
    l = Load.new
    l.load_file
    assert_equal 16, l.find_by("first_name", "Allison").length
  end

  def test_find_by_method_works_with_last_name
    l = Load.new
    l.load_file
    assert_equal 3, l.find_by("last_name", "Nguyen").length
  end

  def test_find_by_method_works_with_zip
    l = Load.new
    l.load_file
    assert_equal 12, l.find_by("zip", "20009").length
  end

end
