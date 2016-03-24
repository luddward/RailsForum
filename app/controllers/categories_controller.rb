class CategoriesController < ApplicationController

  before_action :find_category, except: [:index, :new, :create]

  before_action :validate_admin, except: [:index,:show]
  def index
    @categories = Category.all.order('name DESC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'categories/new'
    end
  end

  def show
    @posts = @category.posts.all.order('created_at DESC')
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category), notice: 'You successfully updated the category'
    else
      render 'categories/edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, alert: 'You have deleted the category'

  end


  private

  def validate_admin
    unless current_user.admin?
      redirect_to root_path, :alert => 'The requested feature is not available to you'
    end
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
