class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def vegetarian
    @products = Product.where(category_id: 13)
  end

  def family_friendly
    @products = Product.where(category_id: 12)
  end

  def easy_fast
    @products = Product.where(category_id: 11)
  end

  def meat_veggies
    @products = Product.where(category_id: 10)
  end
end
