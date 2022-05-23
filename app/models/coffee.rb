class Coffee < ApplicationRecord
  belongs_to :inventory
  has_many :profiles, through: :cart

  has_one_attached :coffee_image

  validates :name, presence: true
  validates :origin, presence: true
  validates :price, presence: true
  validates :roast_type, presence: true
end
