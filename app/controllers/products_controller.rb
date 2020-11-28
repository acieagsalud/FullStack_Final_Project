class ProductsController < ApplicationController
  def index
    # Ransack search variables
    @search = Product.ransack(params[:q])
    @products = @search.result.includes(:subcategory).order(:name).page(params[:page])
    @search.build_condition
  end

  def show
    @product = Product.find(params[:id])
  end

  def sale
    @sale_products = Product.where.not(sale_price: nil)
  end

  def new
    @new_products = Product.where("created_at >= ?", 3.days.ago)
  end

  def add_to_cart
    # id = params[:id].to_i
    # session[:cart] << id unless session[:cart].include?(id)
    # redirect_to products_path
    id = params[:id].to_i
    quantity = params[:quantity].to_i

    session[:cart][id] = quantity unless session[:cart].include?(id)
    redirect_to products_path
  end

  def remove_from_cart
    # id = params[:id].to_i
    # session[:cart].delete(id)
    # redirect_to products_path

    id = params[:id]
    session[:cart].delete(id)
    redirect_to products_path
  end

  def update_cart_quantity
    id = params[:id]
    quantity = params[:quantity].to_i

    session[:cart][id] = quantity if session[:cart].include?(id)

    redirect_to products_path
  end
end
