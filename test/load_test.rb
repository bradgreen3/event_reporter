require 'minitest/autorun'
require 'minitest/pride'
require './lib/load'

class LoadTest < Minitest::Test

  def test_if_load_exists
    assert_equal Load , Load.new.class
  end

  def test_if_load_file_method_returns_data
    refute nil , Load.load_file
  end

end
