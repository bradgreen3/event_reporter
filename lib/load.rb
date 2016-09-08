require './lib/queue'
require './lib/attendee'
require 'csv'
require 'pry'

class Load
  include Cleaner
  attr_reader :attendees, :queue
  def initialize
    @attendees = []
    @queue = Que.new
  end

  def load_file(filename="event_attendees.csv")
    contents = nil
    if File.file?(filename) == false
      puts "That file does not exist"
    else
      # contents == big array of data
      contents = CSV.read filename.to_s, headers: true, header_converters: :symbol
      # iterate through contents
      # and store @attendees/people/row instances in a new array
      @attendees = contents.map do |row|
        Attendee.new(row)
      # send each row to an attendee or person model
      end
      # @people = [<Person # @first_name = "mark" @last_name = "miranda" @zip = 80219><Person # @first_name="brad"]
    end
  end

  def find_by(attribute, search_term)
    @queue.clear
    attendees.find_all do |attendee|
      @queue.party(attendee) if attendee.send(attribute) == Cleaner.clean_name(search_term)
    end
  end
end
