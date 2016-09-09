require 'csv'
require 'erb'
require 'json'
require 'net/http'

class Que

  attr_reader :find_matches

  def initialize
    @find_matches = []
  end

  def party(attendee)
    @find_matches << attendee
  end

  def count
    @find_matches.count
  end

  def clear
    @find_matches = []
  end

  def print(found_matches = @find_matches)
    puts beautify_short("LAST NAME") + beautify_short("FIRST NAME") + beautify_long("EMAIL") +
      beautify_short("ZIPCODE") + beautify_short("CITY") + beautify_short("STATE") +
      beautify_long("ADDRESS") + beautify_short("PHONE") + beautify_short("DISTRICT")
    found_matches.each do |att|
      puts beautify_short(att.last_name) + beautify_short(att.first_name) + beautify_long(att.email) +
      beautify_short(att.zip) + beautify_short(att.city) + beautify_short(att.state) + beautify_long(att.street) +
      beautify_short(att.phone) + beautify_short(att.district)
    end
  end

  def beautify_short(element)
    element.ljust(15)
  end

  def beautify_long(element)
    element.ljust(45)
  end

  def print_by(attribute)
    sorted = @find_matches.sort_by do |attendee|
      attendee.send(attribute)
    end
    print(sorted)
  end

  def save_to(filename)
    Dir.mkdir("output") unless Dir.exists?("output")
    filename = "output/#{filename}"

    CSV.open(filename, "wb") do |csv|
      headers = ["first_name", "last_name", "email_address", "zip", "city", "state", "street", "homephone", "district"]
      csv << headers
      @find_matches.each do |attendee|
          csv << [attendee.send("first_name"), attendee.send("last_name"), attendee.send("email"), attendee.send("zip"), attendee.send("city"), attendee.send("state"), attendee.send("street"), attendee.send("phone"), attendee.send("district")]
      end
    end
  end

  def export_html(filename)
    Dir.mkdir("output") unless Dir.exists?("output")
    filename = "output/#{filename}"
    template = File.read "template.erb"
    erb_template = ERB.new template

    @find_matches.each do |attendee|
      attendee_table = erb_template.result(binding)

    File.open(filename,'w') do |file|
      file.puts attendee_table
      end
    end
  end

  def district
    if @find_matches.count < 10 && @find_matches.count > 0
    api_key = "cc95472b28e4407abc03eb38550200d3"
    @find_matches.each do |attendee|
       uri = URI("http://congress.api.sunlightfoundation.com/districts/locate?zip=#{attendee.zip}&apikey=#{api_key}")
       district = (JSON.load(Net::HTTP.get(uri))["results"].first)
       attendee.district = district["district"].to_s
     end
     else
       puts "Too many attendees in queue to find district"
   end
  end
end
