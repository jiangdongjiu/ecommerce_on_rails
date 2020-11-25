class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add param[:id] to cart.
    id = params[:id].to_i
    quantity = params[:recipe]["quantity"].to_i
    session[:shopping_cart][id] = quantity # hash: {1 => 5, 2 => 6} product(id = 1) have 5 quantity
    flash[:notice] = "#{Product.find(id).name} added to your cart."

    redirect_to root_path
    # logger.debug("Adding #{params[:id]} to the cart.") #termial output
  end

  # DELETE /cart/:id
  def destroy
    # Remove param[:id] from cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id.to_s)
    flash[:notice] = "#{Product.find(id).name} removed from your cart."
    redirect_to root_path
  end

  def checkout
    @cart = cart
    @province = Province.all
  end

  def place_order
    order_entry = current_user.orders.create(
      shipping_address: current_user.default_shipping_address,
      status:           "pending",
      order_pst:        current_user.province.pst,
      order_gst:        current_user.province.gst,
      order_hst:        current_user.province.hst,
      grand_total:      cart.inject(0) { |total, (product, quantity)| total + (product.price * quantity) } * (1 + (current_user.province.hst || +((current_user.province.gst || 0))))
    )
    cart.each do |product, quantity|
      OrderDetail.create(
        product:     product,
        order:       order_entry,
        order_price: product.price,
        quantity:    quantity
      )
    end
  end
end
