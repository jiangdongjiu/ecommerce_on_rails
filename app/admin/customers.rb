ActiveAdmin.register Customer do

  # whitelisting
  permit_params :username,
                :password,
                :phone,
                :email,
                :fullname,
                :billing_address,
                :default_shipping_address,
                :province_id
end
