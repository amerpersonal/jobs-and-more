# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faraday'
require 'json'
require 'generators/data_generator'

include Generators::DataGenerator

ActiveRecord::Base.transaction do
  begin
    categories_names = ['IT', 'Cleaning', 'Construction', 'Mechanical engineering', 'Architecture', 'Sales', 'Support']

    categories = Category.create(categories_names.map { |c| { title: c } })

    people = dummy_persons

    competencies = ["VSS", "SSS", "NK"]

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

    people_transformed = people.map { |p| transform_to_model(p, competencies) }

    companies_attrs = [
      { name: 'Ingemark', email: 'info@ingemark.com' },
      { name: 'Amers', email: 'amer.zildzic@gmail.com' },
      { name: 'Ministry of Programming', email: 'info@mop.ba' },
      { name: 'Personal', email: 'info@personal.ba' },
      { name: 'Logosoft', email: 'info@logosoft.ba' }
    ]

    companies = Company.create(companies_attrs)

    start_date = Date.today - 15
    duration = 7 # days
    step = 2
    job_attrs = []

    positions = [
      {
        title: 'Software Developer',
        description: 'Work full-time at top Silicon Valley or other U.S. companies.
                  Earn a better salary compared to local companies in your city.
                  Grow as a developer by working with the smartest engineers from all over the world.
                  Get paid monthly directly to your bank account. Forget about issues with PayPal or Payoneer.' },

      {
        title: 'UI/UX designer',
        description: 'UX-UI Designers are generally responsible for collecting, researching,
                  investigating and evaluating user requirements. Their responsibility is
                  to deliver an outstanding user experience providing an exceptional and intuitive application design.'
      }
    ]
    companies.each do |company|

      positions.each do |position|
        attrs = {
          title: position[:title],
          description: position[:description],
          start_date: start_date,
          end_date: start_date + duration,
          company: company,
          category: categories[0]
        }

        job_attrs.push(attrs)
        start_date = start_date + step
      end
    end

    jobs = Job.create(job_attrs)

    jobs_applications = people_transformed.map { |person|
      person.merge(job: jobs[0, jobs.length / 2].sample)
    }

    JobApplication.create(jobs_applications)

    User.create! :first_name => 'Amer', :last_name => "Zildzic", :email => 'amer.zildzic@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
  rescue => ex
    puts "Error on seeding: #{ex.message}. Will do rollback..."
    raise ActiveRecord::Rollback
  end
end












