ActiveAdmin.register User do
  permit_params :email,
                :encrypted_password,
                :reset_password_token,
                :reset_password_sent_at,
                :remember_created_at,
                :default_shipping_address,
                :province_id,
                orders_attributes: [:id,
                                    :shipping_address,
                                    :status,
                                    :user_id,
                                    :_destroy,
                                    { order_details_attributes: %i[id
                                                                   product_id
                                                                   order_id
                                                                   order_price
                                                                   quantity
                                                                   order_gst
                                                                   order_pst
                                                                   order_hst
                                                                   _destroy] }]

  # Formtastic gem (google it)
  form do |f|
    f.semantic_errors # shows errors on :base
    # builds an input field for every attribute
    f.inputs "User" do
      f.input :email
      f.input :encrypted_password
      f.input :default_shipping_address
      f.input :province, as: :select
      f.has_many :orders, allow_destroy: true do |n_f|
        n_f.input :status
        n_f.input :shipping_address
        n_f.has_many :order_details do |n_n_f|
          n_n_f.input :product, as: :select
          n_n_f.input :order_price
          n_n_f.input :quantity
          n_n_f.input :order_gst
          n_n_f.input :order_pst
          n_n_f.input :order_hst
        end
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
