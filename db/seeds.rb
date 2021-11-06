# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faraday'
require 'json'

categories_names = ['IT', 'Cleaning', 'Construction', 'Mechanical engineering', 'Architecture', 'Sales', 'Support']

categories = Category.create(categories_names.map { |c| :title => c } )

url = "https://randomuser.me/api/?results=100&inc=name,location,email,dob,cell,picture"

response = Faraday.get url

people = []
if (response.status == 200)
  people = JSON.parse(response.body)['results']
end

# t.string :first_name, limit: 30
# t.string :last_name, limit: 30
# t.date :birth_date
# t.string :email
# t.string :phone_number, limit: 15
# t.string :address
# t.string :competence, limit: 3

competences = ["VSS", "SSS", "NK"]

def transform_to_model(person)
  {
    first_name: person["name"]["first"],
    last_name: person["name"]["last"],
    birth_date: person["dob"]["date"],
    phone_number: person["cell"],
    email: person["email"],
    address: person["location"]["street"]["name"] + " " + person["location"]["street"]["number"],
    competence: competences.sample

  }
end

puts "people #{people.size}" + people[0].inspect

people_transformed = people.map { |p| transform_to_model(p) }


puts "people_transformed #{people.size}" + people_transformed[0].inspect

# t.string :title
# t.text :description
# t.datetime :start_date
# t.datetime :end_date
# t.references :category, null: false, foreign_key: true
# t.references :company, null: false, foreign_key: true

# create_table :companies do |t|
#   t.string :name, limit: 100
#   t.string :email
#
#   t.timestamps
# end

companies_attrs = [
  { name: 'Ingemark', email: 'info@ingemark.com' },
  { name: 'Amers', email: 'amer.zildzic@gmail.com' },
  { name: 'Ministry of Programming', email: 'info@mop.ba' },
  { name: 'Personal', email: 'info@personal.ba' },
  { name: 'Logosoft', email: 'info@logosoft.ba' }
]

companies = Company.create(companies_attrs)

start_date = DateTime.now - 30
duration = 7 # days
step = 2
job_attrs = []

positions = [
  { title: 'Software Developer', description: 'Some random description' },
  { title: 'UI/UX designer', description: 'Some random description' }
]
companies.each  do |company|

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

jobs = Jobs.create(job_attrs)









