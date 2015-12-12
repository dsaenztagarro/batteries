class CreateBatteryPackTypes < ActiveRecord::Migration
  def change
    create_table :battery_pack_types do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :size, null: false
      t.boolean :precharged, default: false
      t.timestamps null: false
    end
  end
end
