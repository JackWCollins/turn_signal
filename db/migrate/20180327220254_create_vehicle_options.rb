class CreateVehicleOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_options do |t|
      t.integer :vehicle_id
      t.integer :option_id

      t.timestamps
    end

    create_table :model_options do |t|
      t.integer :model_id
      t.integer :option_id

      t.timestamps
    end
  end
end
