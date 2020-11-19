ActiveAdmin.register Product do

  # whitelisting
  permit_params :name,
                :price,
                :description,
                :stock,
                :category_id,
                :image_url,
                :image,
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
    f.inputs "Product" do
      f.input :name
      f.input :price
      f.input :description
      f.input :stock
      f.input :image_url
      f.input :image
      f.input :category, as: :select
      f.has_many :order_details, allow_destroy: true do |n_f|
        n_f.input :order
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
