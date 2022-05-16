class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all()
  end
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(Category_params)
    if @category.save 
      redirect_to categorys_path
    else
      render :new
    end
  end
  
  def edit
    category = Category.find(params[:id])
  end


  def update
    @category = Category.find(params[:id])
    if @category.update(Category_params)
      redirect_to categorys_path
    else
        render :edit
    end
  end

  def destroy
    @category = category.find(params[:id]).destroy
    redirect_to categorys_path

  end

  private

    def category_params
      params.require(:Category).permit(:tipo)
    end
end
