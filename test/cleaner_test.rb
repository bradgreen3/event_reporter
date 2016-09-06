require 'minitest/autorun'
require 'minitest/pride'
require './lib/cleaner'

class CleanerTest < Minitest::Test

def test_zeros_are_added_to_short_zipcodes
  assert_equal "00123" , Cleaner.clean_zip("123")
end

def test_long_zips_are_truncated
  assert_equal "12345" , Cleaner.clean_zip("123456")
end

def test_non_string_zip_is_converted
  assert_instance_of String , Cleaner.clean_zip(12345)
end

end
