class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.references :battery_model
      t.timestamps null: false
    end
  end
end
