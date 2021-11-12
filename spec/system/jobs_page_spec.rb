require "rails_helper"

RSpec.describe "Job page", type: :system do
  it "load jobs as expected" do
    visit jobs_path

    expect(page).to have_content("Jobs")
  end
end