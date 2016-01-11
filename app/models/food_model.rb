class FoodModel < ActiveRecord::Base
  belongs_to :brand
  validates_presence_of :brand, :name
  validates_uniqueness_of :name, case_sensitive: false
  delegate :name, to: :brand, prefix: true

  def fullname
    "#{name} #{brand_name}"
  end
end
