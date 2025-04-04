class Listing < ApplicationRecord
  validate :name, :address
end
