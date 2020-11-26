class StripeCheckoutController < ApplicationController
  def create
    # Establish a connection with stripe and then redirect the user to the payment screen.
  end

  def success
    # we took the money 💰
  end

  def cancel
    # payment not complete 😨
  end
end
