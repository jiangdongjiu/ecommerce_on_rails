class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add param[:id] to cart.
    id = params[:id].to_i
    quantity = params[:recipe]["quantity"].to_i
    session[:shopping_cart][id] = quantity # hash: {1 => 5, 2 => 6} product(id = 1) have 5 quantity
    flash[:note] = "#{Product.find(id).name} added to your cart."

    redirect_to root_path
    # logger.debug("Adding #{params[:id]} to the cart.") #termial output
  end

  # DELETE /cart/:id
  def destroy
    # Remove param[:id] from cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id.to_s)
    flash[:note] = "#{Product.find(id).name} removed from your cart."
    redirect_to root_path
  end

  def checkout
    unless user_signed_in?
      flash[:signin] = "Please sign in."
      redirect_to root_path
    end
  end
end
