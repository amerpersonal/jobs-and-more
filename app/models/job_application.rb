class JobApplication < ApplicationRecord
  belongs_to :job

  include JobApplicationValidation
end
