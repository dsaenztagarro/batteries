# Represents a model of battery pack
class BatteryPackModel < ActiveRecord::Base
  belongs_to :battery_model
  validates_numericality_of :size, on: :create
  delegate :fullname, to: :battery_model, prefix: true

  def fullname
    "#{battery_model_fullname} (Pack #{size})"
  end
end
