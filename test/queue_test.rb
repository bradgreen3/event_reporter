require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'
require './lib/queue'

class QueTest < Minitest::Test

  def test_queue_has_find_matches_as_empty_array
    l = Que.new
    assert_equal [] , l.find_matches
  end

  def test_party_can_insert_matches
    l = Que.new
    row = {first_name: "brad", last_name: "green", homephone: 5555551234, city: "denver", state: "colorado", zipcode: 80210}
    a = Attendee.new(row)
    l.party(a)
    assert_equal 1, l.find_matches.count
  end

  def test_count_method_counts_before_and_after_adding
    l = Que.new
    row = {first_name: "brad", last_name: "green", homephone: 5555551234, city: "denver", state: "colorado", zipcode: 80210}
    a = Attendee.new(row)
    assert_equal 0, l.count
    l.party(a)
    assert_equal 1, l.count
  end

  def test_clear_empties_the_find_matches_array
    l = Que.new
    row = {first_name: "brad", last_name: "green", homephone: 5555551234, city: "denver", state: "colorado", zipcode: 80210}
    a = Attendee.new(row)
    l.party(a)
    l.party(a)
    assert_equal 2, l.count
    l.clear
    assert_equal 0, l.count
  end

end
