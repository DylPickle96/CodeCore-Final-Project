class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :make, index: true
      t.string :model, index: true
      t.integer :odometer, index: true
      t.decimal :price, precision: 10, scale: 2, index: true
      t.integer :model_year, index: true
      t.string :condition, index: true
      t.integer :cylinders, index: true
      t.string :drivetrain, index: true
      t.string :fuel, index: true
      t.string :paint_colour, index: true
      t.string :title_status, index: true
      t.string :transmission_type, index: true

      t.timestamps
    end
  end
end
