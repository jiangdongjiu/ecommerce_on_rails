ActiveAdmin.register Province do
  # whitelisting
  permit_params :name,
                :pst,
                :gst,
                :hst
end
