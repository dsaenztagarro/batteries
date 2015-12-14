class CreateDeviceModels < ActiveRecord::Migration
  def change
    create_table :device_models do |t|
      t.string :name
      t.references :battery_size
      t.integer :battery_number
      t.timestamps null: false
    end
  end
end
