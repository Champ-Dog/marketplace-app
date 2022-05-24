class AddQuantityToCoffees < ActiveRecord::Migration[7.0]
  def change
    add_column :coffees, :quantity, :integer
  end
end
