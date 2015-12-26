# Represents a model of battery pack
class BatteryPackModel < ActiveRecord::Base
  belongs_to :battery_model
  validates_presence_of :battery_model
  validates_numericality_of :size
  delegate :fullname, to: :battery_model, prefix: true

  def fullname
    "#{battery_model_fullname} (Pack #{size})"
  end
end
