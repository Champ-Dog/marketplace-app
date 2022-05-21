class Inventory < ApplicationRecord
  belongs_to :profile

  has_many :coffees, dependent: :destroy

  # validates :quantity, presence: true
end
