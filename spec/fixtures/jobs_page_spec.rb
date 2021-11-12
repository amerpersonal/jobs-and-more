require "rails_helper"

RSpec.describe "Job page", type: :system do
  before(:all) {
    Rails.application.load_seed

    # driven_by(:rack_test)
  }

  it "show jobs in a list" do
    visit jobs_path

    within(".jobs") do
      expect(page).to have_selector(".job-item")
    end
  end

  it "return errors if empty form submitted" do
    visit jobs_path

    first_apply_button = find(".job-item .apply", match: :first)

    first_apply_button.click

    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Birth date")
    expect(page).to have_content("Email")
    expect(page).to have_content("Phone number")
    expect(page).to have_content("Address")
    
    expect(page).to_not have_css(".apply-form-error")
    click_button "Apply"

    expect(page).to have_css(".apply-form-error")
  end

  it "return errors if empty form submitted" do
    visit jobs_path

    first_apply_button = find(".job-item .apply", match: :first)

    first_apply_button.click

    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Birth date")
    expect(page).to have_content("Email")
    expect(page).to have_content("Phone number")
    expect(page).to have_content("Address")

    expect(page).to_not have_css(".apply-form-error")
    click_button "Apply"

    expect(page).to have_css(".apply-form-error")
  end

  it "successfully applies for the job and increment applications counter" do
    visit jobs_path

    number_of_applications_before_apply = find(".job-item .job-applications-count", match: :first)["innerHtml"].to_i

    first_apply_button = find(".job-item .apply", match: :first)
    first_apply_button.click

    fill_in "First name", with: "Random user"
    fill_in "Last name", with: "User"
    fill_in "Birth date", with: "90-11-08"
    fill_in "Email", with: "randomuser@something.com"
    fill_in "Phone number", with: "061522222"
    fill_in "Address", with: "Some street no 1"

    find(:css, "#VSS").set(true)

    click_button "apply"

    sleep(5)
    visit jobs_path

    number_of_applications_after_apply = find(".job-item .job-applications-count", match: :first)["innerHtml"].to_i

    expect(current_path).to eq(jobs_path)

  end
end