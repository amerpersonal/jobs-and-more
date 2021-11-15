require 'utils/validators/common'
require 'utils/expirable'

module JobConcern
  extend ActiveSupport::Concern

  include Utils::Validators::Common

  included do

    MIN_DESCRIPTION_WORDS_COUNT = 10

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :title, presence: true, length: { minimum: 10 }
    validates :description, presence: true, length: { minimum: 50 }

    validate :start_end_dates_valid
    validate :validate_description

    def start_end_dates_valid
      if start_date.present? && end_date.present? && start_date > end_date
        errors.add(:end_date, "needs to be after today")
      end
    end

    def validate_description
      if description.present? && !has_min_words?(description, MIN_DESCRIPTION_WORDS_COUNT)
        errors.add("Description has to have minimum #{MIN_DESCRIPTION_WORDS_COUNT} words")
      end
    end

  end

  def expirable
    Utils::Expirable.new(self)
  end

  def duration
    expirable.duration
  end

  def started_before
    expirable.started_before
  end

  def expired?
    expirable.expired?
  end

  def expires_in
    expirable.expires_in
  end

  def expired_ago
    expirable.expired_ago
  end

  def progress_value
    expirable.progress_value
  end

  def progress_value_percentage
    expirable.progress_value_percentage
  end
end
