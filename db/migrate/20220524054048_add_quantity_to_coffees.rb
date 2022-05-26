class AddQuantityToCoffees < ActiveRecord::Migration[7.0]
  def change
    add_column :coffees, :quantity, :integer
    change_column :price, :decimal, precision: 5, scale: 2
  end
end
