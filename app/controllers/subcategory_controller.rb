class SubcategoryController < ApplicationController
  def index
    @subcategories = Subcategory.order(:name)
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end
end
