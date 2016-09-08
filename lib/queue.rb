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

  def print(sorted_matched = @find_matches)
    puts beautify_short("LAST NAME") + beautify_short("FIRST NAME") + beautify_long("EMAIL") +
      beautify_short("ZIPCODE") + beautify_short("CITY") + beautify_short("STATE") +
      beautify_long("ADDRESS") + beautify_short("PHONE") #+ beautify("DISTRICT")

    sorted_matched.each do |att|
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
    # binding.pry
    sorted = @find_matches.sort_by do |attendee|
      attendee.send(attribute)
    end
    # binding.pry
    print(sorted)

    #set sort enumerable to new variable, looping through find_matches,
    #sort find_matches first by the attribute given
    # and then call print
  end

end

#district
#export

# a = "<table>
# <tr><th>Last Name</th><th>First Name
# @find_matches.each do |att|
#   "<tr><td>att.last_name</td><td>#{att.first_name}</td>"
# end
# </table>"
#
# File.write(filename.html, a)
