class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add param[:id] to cart.
    id = params[:id].to_i

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      flash[:notice] = "#{Product.find(id).name} added to your cart."
    end

    redirect_to root_path
    # logger.debug("Adding #{params[:id]} to the cart.") #termial output
  end

  # DELETE /cart/:id
  def destroy
    # Remove param[:id] from cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    flash[:notice] = "#{Product.find(id).name} removed from your cart."
    redirect_to root_path
  end
end
