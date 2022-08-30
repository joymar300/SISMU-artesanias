class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all()
    authorize @categories
  end
  def show
    @category = Category.find(params[:id])

  end
  
  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save 
      flash[:notice] = "Se creo correctamente."
      redirect_to categories_path
    else
      render :new
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end


  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Se actualizó correctamente."
      redirect_to categories_path
    else
        render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    redirect_to categories_path

  end

  private

    def category_params
      params.require(:category).permit(:tipo_categoria)
    end
end
