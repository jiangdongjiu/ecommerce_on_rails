ActiveAdmin.register Product do
  # whitelisting
  permit_params :name,
                :price,
                :description,
                :stock,
                :category_id,
                :image_url,
                :image,
                order_details_attributes: %i[id
                                  product_id
                                  order_id
                                  order_price
                                  quantity
                                  _destroy]

  # Formtastic gem (google it)
  form do |f|
    f.semantic_errors # shows errors on :base
    # builds an input field for every attribute
    f.inputs 'Product' do
      f.input :name
      f.input :price
      f.input :description
      f.input :stock
      f.input :image_url
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ''
      f.input :category, as: :select
      f.has_many :order_details, allow_destroy: true do |n_f|
        n_f.input :order, as: :select, collection: Order.all.map { |o| ["id: #{o.id}, user: #{o.user.email}, created at: #{o.created_at}, updated at: #{o.updated_at}", o.id] }
        n_f.input :order_price
        n_f.input :quantity
      end
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
