class CleaningTask < ApplicationRecord
  belongs_to :reservation
  belongs_to :listing
end
