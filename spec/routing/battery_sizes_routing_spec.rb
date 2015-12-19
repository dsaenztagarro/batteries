require "rails_helper"

RSpec.describe BatterySizesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/battery_sizes").to route_to("battery_sizes#index")
    end

    it "routes to #new" do
      expect(:get => "/battery_sizes/new").to route_to("battery_sizes#new")
    end

    it "routes to #show" do
      expect(:get => "/battery_sizes/1").to route_to("battery_sizes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/battery_sizes/1/edit").to route_to("battery_sizes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/battery_sizes").to route_to("battery_sizes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/battery_sizes/1").to route_to("battery_sizes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/battery_sizes/1").to route_to("battery_sizes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/battery_sizes/1").to route_to("battery_sizes#destroy", :id => "1")
    end

  end
end
