class Device < ActiveRecord::Base
  validates :name, presence: true
  has_many :properties, class: 'DeviceProperty'

  accepts_nested_attributes_for :device_properties, allow_destroy: true
end

