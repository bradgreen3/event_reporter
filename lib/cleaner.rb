class Cleaner

  def self.clean_zip(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def self.clean_phone(phone)
    phonenumber.to_s
    if phonenumber.length < 10
      phonenumber = "555-555-5555"
    elsif phonenumber.length == 10
      phonenumber
    elsif phonenumber.length == 11 && phonenumber[0] == "1"
      phonenumber.slice!(0)
      phonenumber
    elsif phoenumber.length == 11 && phonenumber[0] != "1"
      phonenumber = "555-555-5555"
    elsif phonenumber.length > 11
      phoenumber = "555-555-5555"
    end
  end
end
