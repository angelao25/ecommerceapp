class CategoriesController < ApplicationController
  before_action :authorize!
  def index
    @categories = Category.all.order(name: :asc)
  end

  def new
    @category = Category.new
  end

  def edit
    category
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_url, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if category.update(category_params)
      redirect_to categories_url, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
