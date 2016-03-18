class HomeController < ApplicationController

  def index
    @latestPosts = Post.all.order('created_at DESC').limit(10)
    @latestUsers = User.all.order('created_at DESC').limit(10)
  end

end
