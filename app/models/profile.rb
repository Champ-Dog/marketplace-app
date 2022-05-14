class Profile < ApplicationRecord
  has_many :addresses, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :contact_number, presence: true
  accepts_nested_attributes_for :addresses

  has_one_attached :profile_picture
end
