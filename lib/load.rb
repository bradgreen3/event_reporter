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
      # contents == CSV table
      contents = CSV.read filename.to_s, headers: true, header_converters: :symbol
      # iterate through contents and store people as instances in @attendees array
      # @attendees is a huge array of instances & their associated characeristics
      # (instance variables)
      @attendees = contents.map do |row|
        Attendee.new(row)
      end
    end
  end

  def find_by(attribute, search_term)
    #queue is initialized with Load, find_by clears queue
    @queue.clear
    attendees.find_all do |attendee|
              #party method shovels instances into find_matches
      @queue.party(attendee) if attendee.send(attribute) == Cleaner.clean_name(search_term)
    end
  end
end
