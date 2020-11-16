ActiveAdmin.register Product do

  # whitelisting
  permit_params :name,
                :price,
                :description,
                :stock,
                :category_id
end
