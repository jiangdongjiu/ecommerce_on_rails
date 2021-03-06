class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).all.page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def vegetarian
    @products = Product.includes(:category).where(category_id: 4).page params[:page]
  end

  def family_friendly
    @products = Product.includes(:category).where(category_id: 3).page params[:page]
  end

  def easy_fast
    @products = Product.includes(:category).where(category_id: 2).page params[:page]
  end

  def meat_veggies
    @products = Product.includes(:category).where(category_id: 1).page params[:page]
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    category_filter = params[:category]
    time_filer = params[:time]

    @products = Product.where('name LIKE ? OR description LIKE ?', wildcard_search, wildcard_search)

    if time_filer == 'New'
      @products = @products.where(created_at: (Time.now - 3.days)..Time.now)
    elsif time_filer == 'Recently Updated'
      @products = @products.where(updated_at: (Time.now - 3.minutes)..Time.now)
    end

    @products = @products.where(category_id: category_filter) if category_filter.present?

    @products = @products.page params[:page]
  end
end
