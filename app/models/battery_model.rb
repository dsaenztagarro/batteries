class BatteryModel < ActiveRecord::Base
  belongs_to :battery_size
  validates_inclusion_of :rechargeable, in: [true, false]
  validates_presence_of :battery_size_id, :capacity, :name
  validates_uniqueness_of :name, case_sensitive: false
  delegate :name, to: :battery_size, prefix: true, allow_nil: true

  def fullname
    "#{name} #{battery_size.name} #{capacity}mAh " \
    "#{rechargeable ? 'Rechargeable' : ''}"
  end
end
