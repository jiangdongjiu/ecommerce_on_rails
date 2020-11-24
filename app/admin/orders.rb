ActiveAdmin.register Order do
  # whitelisting
  permit_params :user_id,
                :shipping_address,
                :status,
                order_details_attributes: %i[id
                                             product_id
                                             order_id
                                             order_price
                                             quantity
                                             order_gst
                                             order_pst
                                             order_hst
                                             _destroy]
  # Formtastic gem (google it)
  form do |f|
    f.semantic_errors # shows errors on :base
    # builds an input field for every attribute
    f.inputs "Order" do
      f.input :user, as: :select, collection: User.all.map { |u| ["#{u.email}", u.id] }
      f.input :shipping_address
      f.input :status
      f.has_many :order_details, allow_destroy: true do |n_f|
        n_f.input :product, as: :select
        n_f.input :order_price
        n_f.input :quantity
        n_f.input :order_gst
        n_f.input :order_pst
        n_f.input :order_hst
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
