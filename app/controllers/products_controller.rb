class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def vegetarian
    @products = Product.includes(:category).where(category_id: 13).page params[:page]
  end

  def family_friendly
    @products = Product.includes(:category).where(category_id: 12).page params[:page]
  end

  def easy_fast
    @products = Product.includes(:category).where(category_id: 11).page params[:page]
  end

  def meat_veggies
    @products = Product.includes(:category).where(category_id: 10).page params[:page]
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    category_filter = params[:category]
    if params[:category].present?
      @products = Product.where("(name LIKE ? OR description LIKE ?)", wildcard_search, wildcard_search).where(category_id: category_filter).page params[:page]
    else
      @products = Product.where("(name LIKE ? OR description LIKE ?)", wildcard_search, wildcard_search).page params[:page]
    end
  end
end
