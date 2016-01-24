# Represents the location of an item (device, food, ...)
class Location < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
end
