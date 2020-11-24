class RemoveNameFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :name, :string
  end
end
