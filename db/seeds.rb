require 'faraday'
require 'json'
require 'generators/data_generator'
require 'utils/validators/common'

include Generators::DataGenerator
include Utils::Validators::Common

ActiveRecord::Base.transaction do
  begin
    categories = Category.create(mock_categories)

    companies = Company.create(mock_companies)

    job_attrs = mock_full_jobs(Date.today - 10, 7, 2, companies, categories)
    jobs = Job.create(job_attrs)

    def transform_to_model(person, competencies)
      {
        first_name: person["name"]["first"],
        last_name: person["name"]["last"],
        birth_date: person["dob"]["date"],
        phone_number: person["cell"],
        email: person["email"],
        address: person["location"]["street"]["name"] + " " + person["location"]["street"]["number"].to_s,
        competence: competencies.sample
      }
    end

    applicants = dummy_persons.map { |p| transform_to_model(p, valid_competences) }

    jobs_applications = applicants.map { |person|
      person.merge(job: jobs[0, jobs.length / 2].sample)
    }

    JobApplication.create(jobs_applications)

    test_user_attrs = {
      :first_name => 'Amer',
      :last_name => "Zildzic",
      :email => 'amer.zildzic@gmail.com',
      :password => Rails.application.config.test_user_pass,
      :password_confirmation => Rails.application.config.test_user_pass
    }

    User.create! test_user_attrs
  rescue => ex
    Rails.logger.info "Error on seeding data: #{ex.message}. Will do rollback..."
    raise ActiveRecord::Rollback
  end
end












