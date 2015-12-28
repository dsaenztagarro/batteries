class CreateFoodModels < ActiveRecord::Migration
  def change
    create_table :food_models do |t|
      t.references :brand
      t.string :name
      t.timestamps null: false
    end
  end
end
