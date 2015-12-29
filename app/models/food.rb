class Food < ActiveRecord::Base
  belongs_to :food_model
  validates_presence_of :food_model
  delegate :name, to: :food_model, prefix: true
end
