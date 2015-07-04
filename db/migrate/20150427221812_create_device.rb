class CreateDevice < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
    end

    create_table :properties do |t|
      t.string :value
      t.belongs_to :property_type, index: true
      t.references :attributable, polymorphic: true, index: true
      t.timestamps null: false
    end

    create_table :property_types do |t|
      t.string :name
    end
  end
end
