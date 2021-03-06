require 'active_support'
require 'active_support/core_ext/date/calculations'
require 'utils/validators/common'
require 'generators/data_generator'

include Utils::Validators::Common
include Generators::DataGenerator

module JobApplicationValidation
  extend ActiveSupport::Concern

  EMAIL_REGEX_PATTERN = /\A(.+)@(.+)\z/
  NAME_REGEX_PATTERN = /\A[^0-9`!@#\$%\^&*+_=]+\z/ # /^[a-z ,.'-]+$/  #[a-zA-Z]\z/

  included do
    validates :competence, presence: true, inclusion: { in: valid_competences, message: "Competence has to be one of #{valid_competences.join(", ")}" }
    validates :first_name, presence: true, length: { minimum: 2, maximum: 40 }, format: { with: NAME_REGEX_PATTERN }
    validates :last_name, presence: true, length: { minimum: 2, maximum: 40 }, format: { with: NAME_REGEX_PATTERN }
    validates :email, presence: true, format: { with: EMAIL_REGEX_PATTERN }
    validates :birth_date, presence: true

    validates :phone_number, presence: true #, length: { minimum: 5 }, format: { with: PHONE_REGEX_PATTERN }

    validate :validate_phone_number

    validates :address, presence: true, length: { minimum: 5 }
    validates :email, uniqueness: { scope: :job_id, message: "You already applied to this job" }
    
    validate :validate_age

    def validate_age
      if birth_date.present? && !is_adult(birth_date)
        errors.add(:birth_date, "You have to be older than 18")
      end
    end

    def validate_phone_number
      if phone_number.present? && !is_valid_phone_number?(phone_number)
        errors.add(:phone_number, "format invalid")
      end
    end
  end

end
