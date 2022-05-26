class Address < ApplicationRecord
  belongs_to :profile

  validates :street_number, presence: true
  validates :street_name, presence: true
  validates :suburb, presence: true
  validates :postcode, presence: true, numericality: { only_integer: true, greater_than: 0 }, length: { is: 4 }
  validates :state, presence: true
end
