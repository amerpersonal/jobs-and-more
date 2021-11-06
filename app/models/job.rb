class Job < ApplicationRecord
  belongs_to :category
  belongs_to :company
end
