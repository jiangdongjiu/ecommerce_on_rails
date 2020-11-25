class MoveTaxFieldsFromOrderDetailsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_pst, :decimal
    add_column :orders, :order_gst, :decimal
    add_column :orders, :order_hst, :decimal
    remove_column :order_details, :order_pst, :decimal
    remove_column :order_details, :order_gst, :decimal
    remove_column :order_details, :order_hst, :decimal
  end
end
