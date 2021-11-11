require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:category) { Category.create(title: "Dummy category") }
  let(:company) { Company.create(name: "Some company", email: "some.company@gmail.com") }
  let(:job) { Job.new(
    title: "Senior UX designer",
    description: 'If you are a passionate about UI/UX design, this position is for you',
    start_date: Date.today,
    end_date: Date.today + 1.day,
    category: category,
    company: company)
  }

  it "is not valid when empty" do
    expect(described_class.new).to_not be_valid
  end

  it "is not valid end date before start date" do
    job.end_date = job.start_date - 1.day
    expect(job).to_not be_valid
  end

  it "is not valid without valid title" do
    job.title = "to short"
    expect(job).to_not be_valid
  end

  it "is not valid without valid description" do
    job.description = "to short"
    expect(job).to_not be_valid
  end

  it "is not valid without a category" do
    job.category_id = nil
    expect(job).not_to be_valid
  end

  it "is not valid without a category" do
    job.company_id = nil
    expect(job).not_to be_valid
  end

  it "is valid if all properties are valid" do
    expect(job).to be_valid
  end
end
