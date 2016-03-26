class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy, :lock, :unlock]

  before_action :authenticate_user!, except: [:index, :show]

  before_action :validate_user, only: [:edit, :update, :destroy, :lock, :unlock]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show

  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.category.id = params[:category]

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  # POST
  def lock
    @post.locked = true
    @post.save
    redirect_to @post, :notice => 'Thread locked'
  end

  # POST
  def unlock
    @post.locked = false
    @post.save
    redirect_to @post, :notice => 'Thread unlocked'
  end

  private

  # Finds a post
  def find_post
    @post = Post.find(params[:id])
  end

  # Required parameters to create a post
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  # Validates a user
  def validate_user
    unless current_user == @post.user
      redirect_to post_path(@post), alert: 'You are not allowed to do that!'
    end
  end

end
