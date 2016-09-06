require 'pry'

class Help
  def self.give_help(command)
    if command == []
      "Available commands are: help, help <command>, load <filename>, queue count, queue clear, queue district, queue print, queue print by <attribute>, queue save to <filename>, queue export html <filename>, find <attribute>"
    elsif command == ["load"]
      "Erases any loaded data and parses the specified file. If no filename is given, default is event_attendees.csv"
    elsif command == ["queue", "count"]
      "Outputs how many records are in the current queue"
    elsif command == ["queue", "clear"]
      "Empties the queue"
    elsif command == ["queue", "district"]
      "If there are less than 10 entries in the queue, this command will use the Sunlight API to get Congressional District information for each entry."
    elsif command == ["queue", "print"]
      "Prints out a tab-delimited data table with a header row"
    elsif command == ["queue", "print", "by"]
      "Prints the data table sorted by the specified attribute"
    elsif command == ["queue", "save", "to"]
      "Exports the current queue to the specified filename as a CSV"
    elsif command == ["queue", "export", "html"]
      "Export the current queue to the specified filename as a valid HTML file"
    elsif command == ["find"]
      "Load the queue with all records matching the criteria for the given attribute"
    else
      "That is not a valid command"
    end
  end
end
