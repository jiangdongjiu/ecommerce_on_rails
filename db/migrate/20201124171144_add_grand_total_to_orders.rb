class AddGrandTotalToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :grand_total, :decimal
  end
end
