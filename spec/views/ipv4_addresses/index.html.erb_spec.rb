require 'rails_helper'

RSpec.describe "ipv4_addresses/index", :type => :view do
  before(:each) do
    assign(:ipv4_addresses, [
      IPv4Address.create!(
        :ipv4_address => "IPv4 Address",
        :mac_address => "Mac Address",
        :ptr_record => "Ptr Record"
      ),
      IPv4Address.create!(
        :ipv4_address => "IPv4 Address",
        :mac_address => "Mac Address",
        :ptr_record => "Ptr Record"
      )
    ])
  end

  it "renders a list of ipv4_addresses" do
    render
    assert_select "tr>td", :text => "IPv4 Address".to_s, :count => 2
    assert_select "tr>td", :text => "Mac Address".to_s, :count => 2
    assert_select "tr>td", :text => "Ptr Record".to_s, :count => 2
  end
end
