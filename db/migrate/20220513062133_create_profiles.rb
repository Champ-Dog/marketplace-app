class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :name
      t.integer :contact_number

      t.timestamps
    end
  end
end
