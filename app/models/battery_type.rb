class BatteryType < ActiveRecord::Base
  validates :name, presence: true
  has_many :batteries
end
