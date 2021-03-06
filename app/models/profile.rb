class Profile < ApplicationRecord
  rolify
  belongs_to :user

  has_many :addresses, dependent: :destroy
  has_one :inventory, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :coffees, through: :cart

  has_one_attached :profile_picture

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :contact_number, presence: true, length: { in: 8..10  }
end
