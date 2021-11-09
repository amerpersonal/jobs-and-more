class Job < ApplicationRecord
  belongs_to :category
  belongs_to :company

  has_many :job_applications

  include JobExpiration


end
