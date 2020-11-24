ActiveAdmin.register OrderDetail do
  # whitelisting
  permit_params :product_id,
                :order_id,
                :order_price,
                :quantity,

  # DSL Domain Specific Language
  # Formtastic gem (google it)
  form do |f|
    f.semantic_errors # shows errors on :base
    # builds an input field for every attribute
    f.inputs 'Order Detail' do
      f.input :order_price
      f.input :quantity
      f.input :product, as: :select
      f.input :order, as: :select, collection: Order.all.map { |o| ["id: #{o.id}, user: #{o.user.email}, created at: #{o.created_at}, updated at: #{o.updated_at}", o.id] }
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
