class UsersController < ApplicationController
  include ApplicationHelper

  before_action :validate_admin, except: [:show]

  # GET
  def show
    @user = User.find(params[:id])
  end

  # GET
  def user_manager
    @users = User.all
  end

  private

  def validate_admin
    unless current_user.admin?
      not_found
    end
  end

end
