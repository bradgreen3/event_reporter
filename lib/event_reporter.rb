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
    puts "Default file <event_attendees.csv> loaded"
    l.load_file
  elsif command == 'load' && multiple_words[1].class != nil
    user_file = multiple_words[1]
    puts "File <#{multiple_words[1]}> has been loaded"
    l.load_file(user_file)
  elsif command == 'find' && multiple_words[1].nil?
    puts "You must enter an attribute and search term"
  elsif command == 'find' && multiple_words[1].class != nil
    user_att = multiple_words[1]
    user_search = multiple_words[2]
    puts "Results added to the queue"
    l.find_by(user_att, user_search)
  elsif command == 'queue' && multiple_words[1] == 'count'
    puts l.queue.count
  elsif command == 'queue' && multiple_words[1] == 'clear'
    puts "Queue cleared"
    l.queue.clear
  elsif command == 'queue' && multiple_words[1] == 'print' && multiple_words[2] == 'by'
    l.queue.print_by(multiple_words[3])
  elsif command == 'queue' && multiple_words[1] == 'print'
    l.queue.print
  elsif command == 'queue' && multiple_words[1] == 'save' && multiple_words[2] == 'to'
    puts "Queue saved to <#{multiple_words[3]}>"
    l.queue.save_to(multiple_words[3])
  elsif command == 'queue' && multiple_words[1] == 'export' && multiple_words[2] == 'html'
    puts "Queue exported to <#{multiple_words[3]}>"
    l.queue.export_html(multiple_words[3])
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
