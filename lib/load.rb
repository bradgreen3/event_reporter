require 'csv'
require 'pry'

class Load
  def self.load_file(filename)
    contents = nil
    if filename == nil
      filename = "event_attendees.csv"
      self.load_file(filename)
    elsif File.file?(filename) == false
      puts "That file does not exist"
    else
      contents = CSV.read filename.to_s, headers: true, header_converters: :symbol
      contents.each do |row|
        puts row[:zipcode]
      end
    end
  end
end
