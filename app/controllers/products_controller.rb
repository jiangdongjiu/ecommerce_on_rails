class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end

  def vegetarian
    @products = Product.includes(:category).where(category_id: 13)
  end

  def family_friendly
    @products = Product.includes(:category).where(category_id: 12)
  end

  def easy_fast
    @products = Product.includes(:category).where(category_id: 11)
  end

  def meat_veggies
    @products = Product.includes(:category).where(category_id: 10)
  end
end
