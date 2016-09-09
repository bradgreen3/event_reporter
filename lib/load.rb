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
      contents = CSV.read filename.to_s, headers: true, header_converters: :symbol
      @attendees = contents.map do |row|
        Attendee.new(row)
      end
    end
  end

  def find_by(attribute, search_term)
    @queue.clear
    attendees.find_all do |attendee|
      if attribute == "first_name" || attribute == "last_name" || attribute == "city" || attribute == "state"
        @queue.party(attendee) if attendee.send(attribute) == Cleaner.clean_name(search_term)
      elsif attribute == "email" || attribute == "street"
        @queue.party(attendee) if attendee.send(attribute) == search_term
      elsif attribute == "phone"
        @queue.party(attendee) if attendee.send(attribute) == Cleaner.clean_phone(search_term)
      elsif attribute == "zip"
        @queue.party(attendee) if attendee.send(attribute) == Cleaner.clean_zip(search_term)
      else
        "Invalid attribute"
      end
    end
  end
end
