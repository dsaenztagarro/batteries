class Device < ActiveRecord::Base
  validates :name, presence: true
  has_many :properties, class_name: 'DeviceProperty'

  accepts_nested_attributes_for :properties, allow_destroy: true
end

