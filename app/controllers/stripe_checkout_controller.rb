class StripeCheckoutController < ApplicationController
  def create
    # cart products
    items = []
    subtotal = 0
    cart.each do |product, quantity|
      current_product_amount = (product.price * 100).to_i
      current_product_quantity = quantity.to_i

      current_product = {
        name:        product.name,
        description: product.description,
        amount:      current_product_amount,
        currency:    "cad",
        quantity:    current_product_quantity
      }
      items << current_product
      subtotal += (current_product_amount * current_product_quantity)
    end

    # prevent wrong payment
    if items.blank?
      redirect_to root_path
      return
    end

    # tax
    tax = []
    grand_total = subtotal
    if current_user.province.hst
      hst_amount = (subtotal * current_user.province.hst).to_i
      tax << {
        name:     "HST",
        amount:   hst_amount,
        currency: "cad",
        quantity: 1
      }
      grand_total += hst_amount
    else
      if current_user.province.pst
        pst_amount = (subtotal * current_user.province.pst).to_i
        tax << {
          name:     "PST",
          amount:   pst_amount,
          currency: "cad",
          quantity: 1
        }
        grand_total += pst_amount
      end

      if current_user.province.gst
        gst_amount = (subtotal * current_user.province.gst).to_i
        tax << {
          name:     "GST",
          amount:   gst_amount,
          currency: "cad",
          quantity: 1
        }
        grand_total += gst_amount
      end
    end

    # insert order and order detail data to database
    order_entry = current_user.orders.find_or_create_by(
      shipping_address: current_user.default_shipping_address,
      status:           "new",
      order_pst:        current_user.province.pst,
      order_gst:        current_user.province.gst,
      order_hst:        current_user.province.hst,
      grand_total:      grand_total.to_f / 100
    )
    cart.each do |product, quantity|
      OrderDetail.find_or_create_by(
        product:     product,
        order:       order_entry,
        order_price: product.price,
        quantity:    quantity
      )
    end

    # empty the session

    # Establish a connection with stripe
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      # _url would be everything： http://domain name/_path
      success_url:          checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url:           checkout_cancel_url,
      line_items:           items + tax
    )

    # then redirect the user to the payment screen.
    respond_to do |format|
      format.js # render app/views/checkout/create.js.erb
    end
  end

  def success
    # we took the money 💰
    @checkout_session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@checkout_session.payment_intent)
    # @payment_intent['amount_received'] !=
  end

  def cancel
    # payment not complete 😨
  end
end
