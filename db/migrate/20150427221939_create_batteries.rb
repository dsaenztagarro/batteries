class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.belongs_to :battery_type, index: true
      t.belongs_to :electronic_device, index: true
    end
  end
end
