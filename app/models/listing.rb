class Listing < ApplicationRecord
  validates :name, :address, presence: true
end
