require 'csv'
require 'erb'

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
    #puts column headers for terminal table
    puts beautify_short("LAST NAME") + beautify_short("FIRST NAME") + beautify_long("EMAIL") +
      beautify_short("ZIPCODE") + beautify_short("CITY") + beautify_short("STATE") +
      beautify_long("ADDRESS") + beautify_short("PHONE") #+ beautify("DISTRICT")

    #puts each instance variable of found matches beneath header, one at a time
    found_matches.each do |att|
      puts beautify_short(att.last_name) + beautify_short(att.first_name) + beautify_long(att.email) +
      beautify_short(att.zip) + beautify_short(att.city) + beautify_short(att.state) + beautify_long(att.street) +
      beautify_short(att.phone) #+ beautify(att.district)
    end
  end

  def beautify_short(element)
    element.ljust(15)
  end

  def beautify_long(element)
    element.ljust(45)
  end

  def print_by(attribute)
    #sorted variable = instances(people) sorted by given attribute
    sorted = @find_matches.sort_by do |attendee|
      #sort instances by given attribute
      attendee.send(attribute)
    end
    #call print method w/array of instances sorted by attribute
    print(sorted)
  end

  def save_to(filename)
    Dir.mkdir("output") unless Dir.exists?("output")

    filename = "output/#{filename}"

    CSV.open(filename, "wb") do |csv|
      headers = ["first_name", "last_name", "email_address", "zip", "city", "state", "street", "homephone"]
      csv << headers
      @find_matches.each do |attendee|
          csv << [attendee.send("first_name"), attendee.send("last_name"), attendee.send("email"), attendee.send("zip"), attendee.send("city"), attendee.send("state"), attendee.send("street"), attendee.send("phone")]
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
end

#queue export html <filename.csv>
#queue district

# a = "<table>
# <tr><th>Last Name</th><th>First Name
# @find_matches.each do |att|
#   "<tr><td>att.last_name</td><td>#{att.first_name}</td>"
# end
# </table>"
#
# File.write(filename.html, a)
