class CreateBatterySizes < ActiveRecord::Migration
  def change
    create_table :battery_sizes do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
