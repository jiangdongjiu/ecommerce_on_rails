ActiveAdmin.register Customer do

  # whitelisting
  permit_params :username,
                :password,
                :fullname,
                :email,
                :billing_address,
                :default_shipping_address,
                :phone,
                :province_id
  # DSL Domain Specific Language
  # Formtastic gem (google it)
  form do |f|
    f.semantic_errors # shows errors on :base
    # builds an input field for every attribute
    f.inputs "Customer" do
      f.input :username
      f.input :password
      f.input :fullname
      f.input :email
      f.input :billing_address
      f.input :default_shipping_address
      f.input :phone
      f.input :province, as: :select
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
