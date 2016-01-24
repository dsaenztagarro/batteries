# Manages actions related to main resource
class MainController < ApplicationController
  def index
    @device_counter = Device.count
    @presenter = DashboardPresenter.new(@device_counter)
  end

  def test
  end

  def test_login
  end
end
