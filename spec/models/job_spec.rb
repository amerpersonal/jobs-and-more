require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:category) { Category.create(title: "Dummy category") }
  let(:company) { Company.create(name: "Some company", email: "some.company@gmail.com") }
  let(:job) { Job.new(
    title: "job title",
    description: 'job description',
    start_date: Date.today,
    end_date: Date.today - 1.day,
    category: category,
    company: company)
  }

  it "is not valid when empty" do
    expect(described_class.new).to_not be_valid
  end

  it "is not valid end date before start date" do
    expect(job).to_not be_valid
  end


end
