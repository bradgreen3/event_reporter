require './lib/cleaner'

class Attendee
  include Cleaner
  attr_reader :first_name, :last_name, :zip, :email, :phone, :street, :city, :state

  def initialize(row)
    @first_name = Cleaner.clean_name(row[:first_name])
    @last_name = Cleaner.clean_name(row[:last_name])
    @email = row[:email_address]
    @phone = Cleaner.clean_phone(row[:homephone])
    @street = row[:street]
    @city = Cleaner.clean_name(row[:city])
    @state = Cleaner.clean_name(row[:state])
    @zip = Cleaner.clean_zip(row[:zipcode])
  end
end
