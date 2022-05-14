class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.integer :postcode
      t.string :state

      t.timestamps
    end
  end
end
