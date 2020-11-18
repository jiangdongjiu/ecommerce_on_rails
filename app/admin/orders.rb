ActiveAdmin.register Order do

  # whitelisting
  permit_params :name,
                :customer_id,
                :shipping_address,
                :status,
                order_details: [:id,
                                :product_id,
                                :order_id,
                                :order_price,
                                :quantity,
                                :order_gst,
                                :order_pst,
                                :order_hst,
                                :_destroy]
  # Formtastic gem (google it)
  form do |f|
    f.semantic_errors # shows errors on :base
    # builds an input field for every attribute
    f.inputs "Order" do
      f.input :name
      f.input :customer, as: :select
      f.input :shipping_address
      f.input :status
      f.has_many :order_details, allow_destroy: true do |n_f|
        n_f.input :product
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end

