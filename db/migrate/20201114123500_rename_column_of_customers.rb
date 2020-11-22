class RenameColumnOfCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :billingAddress, :billing_address
    rename_column :customers, :defaultShippingAddress, :default_shipping_address
  end
end
