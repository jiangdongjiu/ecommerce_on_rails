class DDropProducts < ActiveRecord::Migration[6.0]
  def change
    drop_table :products
  end
end
