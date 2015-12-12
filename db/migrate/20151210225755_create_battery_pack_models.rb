class CreateBatteryPackModels < ActiveRecord::Migration
  def change
    create_table :battery_pack_models do |t|
      t.references :battery_model
      t.boolean :precharged
      t.integer :size
    end
  end
end
