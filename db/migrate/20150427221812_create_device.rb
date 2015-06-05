class CreateDevice < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string name
    end

    create_table :device_attributes do |t|
      t.belongs_to :device, index: true
      t.belongs_to :device_attribute_type, index: true
      t.string :value
    end

    create_table :device_attribute_types do |t|
      t.string :name
    end
  end
end
