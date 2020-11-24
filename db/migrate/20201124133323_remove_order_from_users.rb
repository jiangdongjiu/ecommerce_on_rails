class RemoveOrderFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :order, null: true, foreign_key: true
  end
end
