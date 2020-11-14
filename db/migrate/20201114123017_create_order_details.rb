class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :order_price
      t.integer :quantity
      t.decimal :order_pst
      t.decimal :order_gst
      t.decimal :order_hst

      t.timestamps
    end
  end
end
