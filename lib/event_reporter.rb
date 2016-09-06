require 'pry'
require_relative 'load'
require_relative 'help'

class EventReporter

command = ""

  while command != 'q'
    print "Enter command: "
    input = gets.chomp
    multiple_words = input.split(" ")
    command = multiple_words[0]
    case command
    when 'q'    then puts "Exiting Event Reporter"
    when 'help' then puts Help.give_help(multiple_words[1..-1])
    when 'load' then Load.load_file(multiple_words[1])
    end
  end

  #queue count
  #queue clear
  #queue district
  #queue print
  #queue print by
  #queue export html
  #find

end
