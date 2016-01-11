class DeviceModel < ActiveRecord::Base
  belongs_to :battery_size
  validates :battery_number, :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
  validates_numericality_of :battery_number
  delegate :name, to: :battery_size, prefix: true, allow_nil: true
end
