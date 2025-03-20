class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  enum type: { current_residence: 0, mailing_address: 1 }
end
