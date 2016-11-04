require 'rails_helper'

RSpec.describe User, type: :model do

  let(:rob) { create(:user) }

  it "has valid information" do 
    expect(rob).to be_valid 
  end

  context "Invalid information" do
    before :each do
      @rob = create(:user)
    end

    it "name cannot be blank" do
      @rob.name = " "
      expect(@rob).to_not be_valid
    end

    it "email cannot be blank" do
      @rob.email = " "
      expect(@rob).to_not be_valid
    end

    it "password much match" do
      @rob.password = "foobar"
      @rob.password_confirmation = "foozbar"
      expect(@rob).to_not be_valid
    end

    it "password cannot be less than 6 chars" do
      @rob.password = "f" * 5
      @rob.password_confirmation = "f" * 5
      expect(@rob).to_not be_valid
    end
  end
end
