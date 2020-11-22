class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add param[:id] to cart.
    logger.debug("Adding #{params[:id]} to the cart.")
  end

  # DELETE /cart/:id
  def destroy
    # Remove param[:id] from cart
  end
end
