class RemoveCustomerFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :customer, null: false, foreign_key: true
  end
end
