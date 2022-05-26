class Cart < ApplicationRecord
  belongs_to :profile
  belongs_to :coffee

  validates :profile, presence: true
  validates :coffee, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
