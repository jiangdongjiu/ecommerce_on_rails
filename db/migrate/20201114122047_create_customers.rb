class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password
      t.string :fullname
      t.string :email
      t.string :billingAddress
      t.string :defaultShippingAddress
      t.string :phone
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
