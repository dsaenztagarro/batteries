class CreateDevice < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.references :device_model
    end
  end
end
