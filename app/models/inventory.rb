class Inventory < ApplicationRecord
  belongs_to :profile

  has_many :coffees, dependent: :destroy
end
