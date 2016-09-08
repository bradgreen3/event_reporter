module Cleaner

  def self.clean_zip(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def self.clean_phone(phone)
    phone = phone.to_s.gsub(/[^\d,\.]/, '')
    if phone.length < 10
      phone = "0000000000"
    elsif phone.length == 11 && phone[0] == "1"
      phone.slice!(0)
    elsif phone.length == 11 && phone[0] != "1"
      phone = "0000000000"
    elsif phone.length > 11
      phone = "0000000000"
    else
      phone
    end
    phone.insert(3, '-')
    phone.insert(7, '-')
    phone
  end

  def self.clean_name(name)
      name.to_s.gsub(/\W+/, '').capitalize
  end
end
