class CreateGroceries < ActiveRecord::Migration[7.0]
  def change
    create_table :groceries do |t|
      t.string :name
      t.string :address
      t.integer :rating

      t.timestamps
    end
  end
end
