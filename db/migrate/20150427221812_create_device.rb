class CreateDevice < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
    end

    create_table :device_properties do |t|
      t.belongs_to :device, index: true
      t.belongs_to :device_property_type, index: true
      t.string :value
    end

    create_table :device_property_types do |t|
      t.string :name
    end
  end
end
