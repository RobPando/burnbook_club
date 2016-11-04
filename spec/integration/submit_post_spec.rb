require 'rails_helper'

RSpec.describe "Post management", type: :request do

  it "renders back to new if a field is empty" do
    get new_post_path
    expect(response).to render_template(:new)

    post "/posts", params: { post: { author: " ", title: "nae", body: "whater"} }
    expect(response).to render_template(:new)
  end

  it "renders to post once submited" do
    post posts_path, params: { post: { author: "regina", title: "nae", body: "whater"} }
    follow_redirect!
    expect(response).to render_template(:show)
  end

end