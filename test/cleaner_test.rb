require_relative 'test_helper.rb'
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

  def test_short_phone_number_is_converted_to_all_zeros
    assert_equal "000-000-0000" , Cleaner.clean_phone(555123123)
  end

  def test_case_sensitivity_of_name
    assert_equal "Sarah" , Cleaner.clean_name("sArAh")
  end

  def test_leading_and_trailing_whitespace_is_removed
    assert_equal "John", Cleaner.clean_name("John ")
    assert_equal "John", Cleaner.clean_name(" John")
    refute_equal "John Paul", Cleaner.clean_name("Johnpaul")
  end

  def test_erroneous_characters_in_name_are_removed
    assert_equal "Sarah", Cleaner.clean_name(%Q["""Sar/ah""])
  end

end
