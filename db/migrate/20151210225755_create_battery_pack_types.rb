class CreateBatteryPackTypes < ActiveRecord::Migration
  def change
    create_table :battery_pack_types do |t|
      t.string :name
      t.integer :size

      t.timestamps null: false
    end
  end
end
