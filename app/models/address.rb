class Address < ApplicationRecord
  belongs_to :profile

  validates :street_number, presence: true
  validates :street_name, presence: true
  validates :suburb, presence: true
  validates :postcode, presence: true
  validates :state, presence: true
end
