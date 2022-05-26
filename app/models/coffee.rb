class Coffee < ApplicationRecord
  belongs_to :inventory
  has_many :carts, dependent: :destroy
  has_many :profiles, through: :cart

  has_one_attached :coffee_image

  validates :name, presence: true
  validates :origin, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :roast_type, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
