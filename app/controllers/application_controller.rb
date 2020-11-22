class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart
  
  private

  def initialize_session
    session[:shopping_cart] ||= [] # shopping cart default empty array.
  end

  def cart
    Product.find(session[:shopping_cart]) # array if id will return a collection of products
  end
end
