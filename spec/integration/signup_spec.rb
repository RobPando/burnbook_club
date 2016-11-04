require 'rails_helper'

RSpec.describe "Users management", type: :request do

  let(:user) { create(:user) }

  it "renders /new if information is invalid" do
    get signup_path
    expect(response).to render_template(:new)

    post users_path, params: { user: { name: " " } }
    expect(response).to render_template(:new)
  end

  it "renders the users page if information is valid" do
    post users_path, params: { user: { name: "robert", 
                                     email: "robert@example.com", 
                                     password: "foobar", 
                                     password_confirmation: "foobar" } }

    follow_redirect!
    expect(response).to render_template(:show)
  end
end