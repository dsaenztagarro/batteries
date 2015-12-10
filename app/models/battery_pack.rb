class BatteryPack < ActiveRecord::Base
  belongs_to :battery_pack_type
  has_many :batteries
end
