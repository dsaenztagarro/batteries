class BatteryPack < ActiveRecord::Base
  belongs_to :battery_pack_model
  has_many :batteries
  delegate :fullname, to: :battery_pack_model, prefix: true
  validates_presence_of :battery_pack_model
end
