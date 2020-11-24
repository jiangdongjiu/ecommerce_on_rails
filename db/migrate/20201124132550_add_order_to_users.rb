class AddOrderToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :order, null: true, foreign_key: true
  end
end
