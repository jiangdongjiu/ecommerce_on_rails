ActiveAdmin.register Order do

  # whitelisting
  permit_params :customer_id,
                :shipping_address,
                :status

end
