class CreateBatterySizes < ActiveRecord::Migration
  def change
    create_table :battery_sizes do |t|

      t.timestamps null: false
    end
  end
end
