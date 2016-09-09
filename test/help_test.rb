require_relative 'test_helper.rb'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/help.rb'

class HelpTest < Minitest::Test

  def test_no_given_argument_returns_all_available_commands
    answer = Help.give_help([])
    assert_equal "Available commands are:", answer.slice(0..22)
  end

  def test_single_argument_given_returns_proper_value
    assert_equal "Erases any loaded data and parses the specified file. If no filename is given, default is event_attendees.csv" , Help.give_help(["load"])
  end

  def test_two_arguments_given_returns_proper_value
    assert_equal "Empties the queue" , Help.give_help(%w(queue clear))
  end

  def test_responds_to_command_that_does_not_exist
    assert_equal "That is not a valid command" , Help.give_help(%w(poop))
    assert_equal "That is not a valid command" , Help.give_help(%w(poop poop))
    assert_equal "That is not a valid command" , Help.give_help(%w(poop poop poop))
  end

end
