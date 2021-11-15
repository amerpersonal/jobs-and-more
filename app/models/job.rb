class Job < ApplicationRecord
  belongs_to :category
  belongs_to :company
  has_many :job_applications, dependent: :destroy

  scope :by_category, -> (category) { joins(:category).where("categories.title = ?", category) }
  scope :for_term, -> (term) { joins(:company).where("lower(jobs.title) like ? or lower(companies.name) like ?", "%#{term.to_s.downcase}%", "%#{term.to_s.downcase}%") }
  scope :sorted_by_date ,-> { order(created_at: :desc) }
  scope :already_started, -> { where("jobs.start_date <= ?", Date.today) }

  include JobConcern
end
