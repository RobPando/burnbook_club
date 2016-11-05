require 'rails_helper'

# Test the behavior of requests on Visitors

RSpec.describe "Session management", type: :request do
  
  it "renders log in page" do
    get login_path
    expect(response).to render_template(:new)
  end

  it "submitting information renders back to new" do
    post login_path, params: { session: { email: "what eva", password: "fooa"} }
    expect(response).to render_template(:new)
  end

  context "log user successfully" do
    before do
      @user = create(:user)
    end

    it "is a successful login" do
      post login_path, params: { session: {email: @user.email, password: @user.password }}
      expect(flash[:success]).to be_present
      expect(response).to redirect_to(root_url) 
    end
  end
end

# Test for the expected behavior on Views

RSpec.feature "Home page Log change", type: :feature do

  it "shows log in link if user is not logged in " do
    visit root_url
    expect(page).to have_link("Log in")
    expect(page).to have_link("Sign up")
  end

  it "does not show log out if user is not logged in" do
    visit root_url
    expect(page).to_not have_link("Log out")
  end
end
