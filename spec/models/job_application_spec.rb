require 'rails_helper'
require 'date'
require 'utils/validators/common'

RSpec.describe JobApplication, type: :model do
  let(:category) { Category.create!(title: "Dummy category") }
  let(:company) { Company.create!(name: "Some company", email: "some.company@gmail.com") }
  let(:job) { Job.create!(
    title: "UI/UX designer",
    description: 'here is some job description for dummy job posting, I hope you gonna like it',
    start_date: Date.today,
    end_date: Date.today + 1,
    category: category,
    company: company)
  }

  let(:subject) { JobApplication.new(
        first_name: "John",
        last_name: "Doe",
        birth_date: Date.today - 18.years,
        email: "neko@example.com",
        phone_number: "0038761522222",
        address: "Avenue 88",
        competence: "VSS",
        job_id: job.id
      )
  }

  it "is not valid when empty" do
    empty = described_class.new
    expect(empty).to_not be_valid
  end

  it "is not valid when candidate is younger than 18" do
    subject.birth_date = Date.today - 17.years
    expect(subject).not_to be_valid
  end

  it "is not valid when phone number is empty" do
    subject.phone_number = ""
    expect(subject).not_to be_valid
  end

  it "is not valid when phone number contains spaces only" do
    subject.phone_number = "      "
    expect(subject).not_to be_valid
  end

  it "is not valid when phone number contains letter" do
    subject.phone_number = "1232323a"
    expect(subject).to_not be_valid
  end

  it "is valid when phone number contains numbers only" do
    subject.phone_number = "1232323123"
    expect(subject).to be_valid
  end

  it "is valid when phone number contains numbers and space at the beginning" do
    subject.phone_number = "1232323122"
    expect(subject).to be_valid
  end

  it "is valid when phone number contains numbers and multiple spaces" do
    subject.phone_number = "+1 232 323 22"
    expect(subject).to be_valid
  end

  it "is valid when all attributes are valid" do
    expect(subject).to be_valid
  end

end
