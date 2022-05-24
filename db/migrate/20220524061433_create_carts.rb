class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :coffee, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
