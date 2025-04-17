class Listing < ApplicationRecord
  has_many :reservations
  validates :name, :address, presence: true
end
