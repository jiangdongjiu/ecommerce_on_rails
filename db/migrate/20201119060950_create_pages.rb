class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.string :permalink

      t.timestamps
    end
  end
end
