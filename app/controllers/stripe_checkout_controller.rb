class StripeCheckoutController < ApplicationController
  def create
    # load cart
    items = []
    cart.each do |product, quantity|
      current_product = {
        name:        product.name,
        description: product.description,
        amount:      (product.price * 100).to_i,
        currency:    "cad",
        quantity:    quantity.to_i
      }
      items << current_product
    end

    if items.blank?
      redirect_to root_path
      return
    end

    # Establish a connection with stripe
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      # _url would be everything： http://domain name/_path
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           items
    )

    # then redirect the user to the payment screen.
    respond_to do |format|
      format.js # render app/views/checkout/create.js.erb
    end
  end

  def success
    # we took the money 💰
  end

  def cancel
    # payment not complete 😨
  end
end
