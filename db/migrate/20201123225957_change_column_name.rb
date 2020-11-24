class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :defaultShippingAddress, :default_shipping_address
  end
end
