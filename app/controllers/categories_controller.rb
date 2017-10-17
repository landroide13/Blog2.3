class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 2)
  end

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Categoy successfully created.."
      redirect_to categories_path
    else
      flash[:danger] = "Upss, somethings comming up, try it again.."
      render 'new'
    end
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end