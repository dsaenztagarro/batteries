# Responsible for managing all information related to dashboard
class DashboardPresenter
  attr_reader :device_counter

  def initialize(device_counter)
    @device_counter = device_counter
  end
end
