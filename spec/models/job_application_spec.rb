require 'rails_helper'
require 'date'

RSpec.describe JobApplication, type: :model do
  before(:all) do
    Job.destroy_all
    Company.destroy_all
    Category.destroy_all
  end

  subject {
    @category = Category.new(title: "Dummy category")
    @company = Company.new(name: "Some company", email: "some.company@gmail.com")
    @job = Job.new(title: "job title", description: 'job description', start_date: Date.today, end_date: Date.today, category: @category, company: @company)

    @category.save!
    @company.save!
    @job.save!

    described_class.new(
      first_name: "John",
      last_name: "Doe",
      birth_date: Date.today - 15.years,
      email: "neko@example.com",
      phone_number: "0038761522222",
      address: "Avenue 88",
      competence: "VSS",
      job_id: @job.id
    )
  }

  it "is not valid when empty" do
    empty = described_class.new
    expect(empty).to_not be_valid
  end

  it "is valid when all attributes set" do
    expect(subject).to be_valid
  end

end
