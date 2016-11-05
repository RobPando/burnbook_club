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
    before :each do
      @user = create(:user)
      log_in(@user)
    end

    it "is a successful login" do
      expect(flash[:success]).to be_present
      expect(response).to redirect_to(root_url) 
    end

    it "renders edit page" do
      get edit_user_path(@user)
      expect(response).to render_template(:edit)
    end

    it "updates information" do
      put user_path(@user), params: { user: { name: "bla",
                                              email: "exemp@example.com",
                                              password: "foozbar",
                                              password_confirmation: "foozbar"} }
      expect(response).to redirect_to(@user)
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
