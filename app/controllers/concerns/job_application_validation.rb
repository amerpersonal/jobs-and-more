module JobApplicationValidation
  extend ActiveSupport::Concern

  VALID_COMPETENCES = ["VSS", "SSS", "NS"]
  EMAIL_REGEX_PATTERN = /\A(.+)@(.+)\z/
  PHONE_REGEX_PATTERN = /\d{6,}( )*\z/ #/^(00)?[0-9]+[ ]+/
  NAME_REGEX_PATTERN = /\A[^0-9`!@#\$%\^&*+_=]+\z/ # /^[a-z ,.'-]+$/  #[a-zA-Z]\z/

  included do
    validates :competence, presence: true, inclusion: { in: VALID_COMPETENCES, message: "Competence has to be one of #{VALID_COMPETENCES.join(", ")}" }
    validates :first_name, presence: true, length: { minimum: 2, maximum: 40 }, format: { with: NAME_REGEX_PATTERN }
    validates :last_name, presence: true, length: { minimum: 2, maximum: 40 }, format: { with: NAME_REGEX_PATTERN }
    validates :email, presence: true, format: { with: EMAIL_REGEX_PATTERN }
    validates :birth_date, presence: true
    validates :phone_number, presence: true, length: { minimum: 5 }, format: { with: PHONE_REGEX_PATTERN }
    validates :address, presence: true, length: { minimum: 5 }
    validates :email, uniqueness: { scope: :job_id, message: "You already applied to this job" }
  end

  def valid_competences
    VALID_COMPETENCES
  end
end
