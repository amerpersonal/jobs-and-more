require 'utils/validators/common'

RSpec.describe Utils::Validators::Common do
  include Utils::Validators::Common

  it "is not valid when empty" do
    expect(is_valid_phone_number?("")).to eq false
  end

  it "is not valid when contains only multiple spaces" do
    expect(is_valid_phone_number?("           ")).to eq false
  end

  it "is not valid when contains one letter" do
    expect(is_valid_phone_number?("0038761522222a")).to eq false
  end

  it "is not valid when contains less than 9 digits" do
    expect(is_valid_phone_number?("522222")).to eq false
  end

  it "is not valid when contains any char different than space, - or digit" do
    expect(is_valid_phone_number?("0038761522222x")).to eq false
  end

  it "is valid when all constraints satisfied with spaces" do
    expect(is_valid_phone_number?("00 387 61 522 222")).to eq true
  end

  it "is valid when all constraints satisfied with minus" do
    expect(is_valid_phone_number?("00 387 61-522-222")).to eq true
  end

  it "is valid when all constraints satisfied numbers only" do
    expect(is_valid_phone_number?("0038761522222")).to eq true
  end

  it "is valid when all constraints satisfied with plus at the start" do
    expect(is_valid_phone_number?("+38761522222")).to eq true
  end

  it "is valid for valid >= 9 digit number" do
    expect(is_valid_phone_number?(38761522222)).to eq true
  end

end