class BatteryModel < ActiveRecord::Base
  belongs_to :battery_size
  validates_presence_of :battery_size_id, :capacity, :name, :rechargeable
  validates_uniqueness_of :name
  delegate :name, to: :battery_size, prefix: true, allow_nil: true

  def fullname
    "#{name} #{battery_size.name} #{capacity}mAh " \
    "#{rechargeable ? 'Rechargeable' : ''}"
  end
end
