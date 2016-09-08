require 'pry'
require_relative 'load'
require_relative 'help'

command = ""
l = Load.new
while command != 'q'
  print "Enter command: "
  input = gets.chomp
  multiple_words = input.split(" ")
  command = multiple_words[0]

  if command == 'q'
    puts "Exiting Event Reporter"
  elsif command == 'help'
    puts Help.give_help(multiple_words[1..-1])
  elsif command == 'load' && multiple_words[1].nil?
    l.load_file
  elsif command == 'load' && multiple_words[1].class != nil
    user_file = multiple_words[1]
    l.load_file(user_file)
  elsif command == 'find' && multiple_words[1].nil?
    puts "You must enter an attribute and search term"
  elsif command == 'find' && multiple_words[1].class != nil
    user_att = multiple_words[1]
    user_search = multiple_words[2]
    l.find_by(user_att, user_search)
  elsif command == 'queue' && multiple_words[1] == 'count'
      puts l.queue.count
  elsif command == 'queue' && multiple_words[1] == 'clear'
    l.queue.clear
  elsif command == 'queue' && multiple_words[1] == 'print' && multiple_words[2] == 'by'
    l.queue.print_by(multiple_words[3])
  elsif command == 'queue' && multiple_words[1] == 'print'
      l.queue.print
  else
    puts "Invalid entry"
  end
end


# class EventReporter
#   def initialize
#     @command = ""
#     @attribute1 = ""
#     @attribute2 = ""
#     @search_term = ""
#   end
#
#   def run
#     while @command != "quit"
#       puts "please enter a command:"
#       @command = gets.chomp
#     end
#   end
#
#
# end
#
# er = EventReporter.new
# er.run
