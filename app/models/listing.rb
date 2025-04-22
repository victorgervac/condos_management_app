class Listing < ApplicationRecord
  extend FriendlyId
  has_many :reservations
  validates :name, :address, presence: true
  friendly_id :name, use: :slugged
end
