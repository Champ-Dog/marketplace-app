class Address < ApplicationRecord
  belongs_to :profile

  def display_address
    return "#{street_number} #{street_name} #{suburb} #{postcode} #{state}"
  end
end
