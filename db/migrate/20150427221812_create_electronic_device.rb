class CreateElectronicDevice < ActiveRecord::Migration
  def change
    create_table :electronic_devices do |t|
      t.string name
    end
  end
end
