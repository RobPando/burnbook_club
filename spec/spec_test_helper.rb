module SpecTestHelpers

  def log_in(user, remember_me: '1')
    post login_path, params: { session: { email: user.email, password: user.password, remember_me: remember_me } }
  end

  def post_gossip(post)
    post posts_path, params: { post: { title: post.title, body: post.body } }
  end

end