require "rails_helper"

RSpec.describe IPv4AddressesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ipv4_addresses").to route_to("ipv4_addresses#index")
    end

    it "routes to #new" do
      expect(:get => "/ipv4_addresses/new").to route_to("ipv4_addresses#new")
    end

    it "routes to #show" do
      expect(:get => "/ipv4_addresses/1").to route_to("ipv4_addresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ipv4_addresses/1/edit").to route_to("ipv4_addresses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ipv4_addresses").to route_to("ipv4_addresses#create")
    end

    it "routes to #update" do
      expect(:put => "/ipv4_addresses/1").to route_to("ipv4_addresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ipv4_addresses/1").to route_to("ipv4_addresses#destroy", :id => "1")
    end

  end
end
