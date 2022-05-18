class CreateCoffees < ActiveRecord::Migration[7.0]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :origin
      t.string :description
      t.string :roast_type
      t.float :price
      t.references :inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
