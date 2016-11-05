require 'rails_helper'

# Test for requests on Posts

RSpec.describe "Post management", type: :request do

  context "When user is successfully signed in" do
    
    before :each do
      @user = create(:user)
      log_in(@user)
      @post = create(:post)
    end

    it "renders to post once submited" do
      post posts_path, params: { post: { title: "nae", body: "whater"} }
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it "edits post" do
      get edit_post_path(@post)
      expect(response).to render_template(:edit)
    end
  end
end

# Test for views on Posts

RSpec.feature "Posts management", type: :feature do

  before :each do
    create(:post)
  end

  context "A non member cannot see the author of a post" do
    it "sees memeber only as author" do
      visit post_path(1)
      expect(page).to have_content("By MEMBERS ONLY")
    end

  end

  context "A member can see the name of the author" do

    before :each do
      @user = create(:user, member: true)
      visit login_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it "sees the name of author 'example'" do
      visit post_path(1)
      expect(page).to have_content("fulano")
    end

    it "automatically adds the name of the author to post" do
      visit new_post_path
      fill_in 'Title', with: "some gossip"
      fill_in 'Body', with: "Some more detail"
      click_button 'Post'
      expect(page).to have_content("example")
    end
  end
end













