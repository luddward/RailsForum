class UserRanksController < ApplicationController

  before_action :find_rank, only: [:show, :edit, :update, :destroy]
  before_action :validate_admin

  def index
    @userranks = UserRank.all.order('level DESC')
  end

  def create
    @userrank = UserRank.new(rank_params)

    if @userrank.save
      redirect_to user_ranks_path
    else
      render 'user_ranks/new'
    end
  end

  def show
  end

  def new
    @userrank = UserRank.new
  end

  def edit

  end

  def update
    if @userrank.update(category_params)
      redirect_to user_rank_path(@userrank), notice: 'You successfully updated the user rank'
    else
      render 'user_ranks/edit'
    end
  end

  def destroy
    @userrank.destroy
    redirect_to user_ranks_path, alert: 'You have deleted the user rank'
  end

  # GET
  def change_rank
    @user = User.find(params[:id])
  end

  # POST
  def save_user_rank
    @user = User.find(params[:id])
    @user_rank = UserRank.find(simple_rank_params[:user_rank])

    @user.user_rank = @user_rank

    if @user.save
      redirect_to user_path(@user), :success => 'User rank changed successfully'
    else
      render 'user_ranks/change_user'
    end
  end

  private

  # Never trust the scary internet!
  def rank_params
    params.require(:user_rank).permit(:name, :level)
  end

  def simple_rank_params
    params.require(:user).permit(:user_rank)
  end

  # Finds a a rank
  def find_rank
    @userrank = UserRank.find(params[:id])
  end

  # Returns 404 if a non admin should try to access the controller actions
  def validate_admin
    unless current_user.admin?
      not_found
    end
  end

end
