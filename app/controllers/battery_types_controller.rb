class BatteryTypesController < ApplicationController
  def index
    @battery_types = BatteryType.all
  end
end
