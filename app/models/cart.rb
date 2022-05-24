class Cart < ApplicationRecord
  belongs_to :profile
  belongs_to :coffee

  validates :profile, presence: true
  validates :coffee, presence: true

  # attr_accessible :coffee_id, :profile_id
end
