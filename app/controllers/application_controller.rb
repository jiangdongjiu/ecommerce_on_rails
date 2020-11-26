class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart
  helper_method :grand_total

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[default_shipping_address province_id])
  end

  private

  def initialize_session
    session[:shopping_cart] ||= {} # shopping cart default empty hash.
  end

  def cart
    session[:shopping_cart].transform_keys { |product_id| Product.find(product_id) }
    # Product.find(session[:shopping_cart]) # array if id will return a collection of products
  end

  def grand_total
    cart.inject(0) { |total, (product, quantity)| total + (product.price * quantity) } * (1 + (current_user.province.hst || + ((current_user.province.gst || 0))))
  end
end
