class ChangeOrdersAttributeShippingAddressToShippingAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :shippingAddress, :shipping_address
  end
end