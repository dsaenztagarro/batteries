class CreateBatteryPacks < ActiveRecord::Migration
  def change
    create_table :battery_packs do |t|

      t.timestamps null: false
    end
  end
end
