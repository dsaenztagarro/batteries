class Device < ActiveRecord::Base
  validates :name, presence: true
  has_many :device_properties
end

