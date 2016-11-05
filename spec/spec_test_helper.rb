module SpecTestHelpers

  def log_in(user)
    post login_path, params: { session: { email: user.email, password: user.password } }
  end

  def post_gossip(post)
    post posts_path, params: { post: { title: post.title, body: post.body } }
  end

end