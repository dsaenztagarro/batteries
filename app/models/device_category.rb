class DeviceCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
