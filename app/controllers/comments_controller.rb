class CommentsController < ApplicationController

  before_action :find_comment, except: :create

  before_action :authenticate_user!, except: [:index, :show]

  before_action :validate_user, except: :create

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:comment))
    @comment.user_id = current_user.id if current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      @comment.errors.full_messages.each do |msg|
        flash[:error] = msg
      end
      redirect_to post_path(@post)
    end
  end

  def edit

  end

  # Updates the comment
  def update
    if @comment.update(params[:comment].permit(:comment))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  # deletes the comment
  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  # Finds and retrives the comments with the ID
  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  # Validates user ownership of comments.
  def validate_user
    unless current_user == @comment.user
      redirect_to(post_path(@post), alert: 'You are not allowed to do that')
    end
  end

end
