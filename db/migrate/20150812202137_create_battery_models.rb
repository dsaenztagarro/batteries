class CreateBatteryModels < ActiveRecord::Migration
  def change
    create_table :battery_models do |t|
      t.references :battery_size
      t.integer :capacity
      t.string :name
      t.boolean :rechargeable
      t.timestamps null: false
    end
  end
end
