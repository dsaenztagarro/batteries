class CreateBatteryTypes < ActiveRecord::Migration
  def change
    create_table :battery_types do |t|
      t.string name
    end
  end
end
