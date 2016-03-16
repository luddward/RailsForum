class CategoriesController < ApplicationController

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
    @category = Category.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
