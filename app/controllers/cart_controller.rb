class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add param[:id] to cart.
    id = params[:id].to_i
    # quantity = params[:recipe]["quantity"].to_i # hash: {1 => 5, 2 => 6} product(id = 1) have 5 quantity
    session[:shopping_cart][id] = 1
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

    if cart.blank?
      flash[:cart_blank] = "Add recipes to your cart to checkout."
      redirect_to root_path
    end
  end

  def edit
    id = params[:id]
    edit = params[:edit]

    if edit == "add_one"
      session[:shopping_cart][id] = session[:shopping_cart][id] + 1
    elsif edit == "remove_one"
      if session[:shopping_cart][id] != 1
        session[:shopping_cart][id] = session[:shopping_cart][id] - 1
      end
    else
      session[:shopping_cart].delete(id)
    end

    redirect_to checkout_cart_index_path
  end
end
