# Represents a battery size resource
class BatterySize < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
