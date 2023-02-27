class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :location
      t.string :number_plate
      t.integer :capacity
      t.string :year
      t.integer :price

      t.timestamps
    end
  end
end
