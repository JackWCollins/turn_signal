class CreateVehicleTables < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.integer :make_id
      t.integer :model_id
      t.text :description

      t.timestamps
    end

    create_table :makes do |t|
      t.string :name

      t.timestamps
    end

    create_table :models do |t|
      t.string :name
      t.integer :make_id

      t.timestamps
    end

    create_table :options do |t|
      t.string :name

      t.timestamps
    end
  end
end
