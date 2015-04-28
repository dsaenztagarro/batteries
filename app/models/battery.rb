class Battery < ActiveRecord::Base
  belongs_to :battery_type
  belongs_to :device
  validates :battery_type, presence: true
  delegate :name, to: :battery_type, prefix: true
  delegate :name, to: :device, prefix: true, allow_nil: true
end
