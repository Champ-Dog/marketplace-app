class ChangeQuantityToIntegerInCarts < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :quantity, :integer
  end
end
