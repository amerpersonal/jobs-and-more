require 'utils/validators/common'

module JobValidation
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

  def duration
    ((end_date - start_date) / 1.day).to_i
  end

  def started_before
    ((Date.today - start_date) / 1.day).to_i
  end

  def expired?
    end_date > Date.today
  end

  def expires_in
    duration - started_before
  end


  def progress_value
    if expired?
      duration
    else
      started_before
    end
  end

  def progress_value_percentage
    if expired?
      100
    else
      (started_before.to_f / duration.to_f) * 100
    end
  end

  def progress_tooltip_text
    if expired?
      "Job posting expired " + (started_before - duration).to_s + " days ago"
    else
      "Job posting opened " + started_before.to_s + " day ago, expires in " + expires_in.to_s + " days"
    end
  end
end
