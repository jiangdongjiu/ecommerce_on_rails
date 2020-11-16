ActiveAdmin.register OrderDetail do

  # whitelisting
  permit_params :product_id,
                :order_id,
                :order_price,
                :quantity,
                :order_gst,
                :order_hst,
                :order_pst

  # DSL Domain Specific Language
  # Formtastic gem (google it)
  form do |f|
    f.semantic_errors # shows errors on :base
    # builds an input field for every attribute
    f.inputs "Customer" do
      f.input :order_price
      f.input :quantity
      f.input :order_gst
      f.input :order_pst
      f.input :order_hst
      f.input :product, as: :select
      f.input :order, as: :select
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
