module JobValidation
  extend ActiveSupport::Concern

  included do
    validate :start_end_dates_valid
    validates :title, presence: true, length: { minimum: 10 }
    validates :description, presence: true, length: { minimum: 20 }

    def start_end_dates_valid
      if start_date.present? && end_date.present? && start_date > end_date
        errors.add(:end_date, "Need to be after end date")
      end
    end
  end

  def duration
    ((end_date - start_date) / 1.day).to_i
  end

  def started_before
    ((Time.zone.now - start_date) / 1.day).to_i
  end

  def expired?
    started_before >= duration
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
