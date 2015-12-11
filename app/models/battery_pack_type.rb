# Represents a type of battery pack
class BatteryPackType < ActiveRecord::Base
  validates_presence_of :name, :description, :size
  validates_uniqueness_of :name
  validates_numericality_of :size, on: :create
end
