class BatteryModel < ActiveRecord::Base
  belongs_to :battery_size
  validates_presence_of :battery_size_id, :capacity, :name, :rechargeable
  delegate :name, to: :battery_size, prefix: true

  def fullname
    "#{name} #{battery_size.name} #{capacity}mAh " \
    "#{rechargeable ? 'Rechargeable' : ''}"
  end
end
