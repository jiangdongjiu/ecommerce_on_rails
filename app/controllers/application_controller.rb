class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    session[:shopping_cart] ||= {} # shopping cart default empty hash.
  end

  def cart
    session[:shopping_cart].transform_keys { |product_id| Product.find(product_id) }
    # Product.find(session[:shopping_cart]) # array if id will return a collection of products
  end
end
