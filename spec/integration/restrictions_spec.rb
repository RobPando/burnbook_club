require 'rails_helper'

RSpec.describe "Restrictions managment", type: :request do

  context "unregistered user" do
    it "new post redirects to log in page" do
      get new_post_path
      expect(response).to redirect_to(login_path)
    end
  end
end