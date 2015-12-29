class FoodModel < ActiveRecord::Base
  belongs_to :brand
  validates :name, presence: true, uniqueness: true
  validates_presence_of :brand
  delegate :name, to: :brand, prefix: true

  def fullname
    "#{name} #{brand_name}"
  end
end
