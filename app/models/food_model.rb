class FoodModel < ActiveRecord::Base
  belongs_to :brand
  validates :name, presence: true, uniqueness: true
  validates_presence_of :brand
end
