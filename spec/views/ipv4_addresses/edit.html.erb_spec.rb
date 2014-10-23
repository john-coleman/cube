require 'rails_helper'

RSpec.describe "ipv4_addresses/edit", :type => :view do
  before(:each) do
    @ipv4_address = assign(:ipv4_address, IPv4Address.create!(
      :ipv4_address => "MyString",
      :mac_address => "MyString",
      :ptr_record => "MyString"
    ))
  end

  it "renders the edit ipv4_address form" do
    render

    assert_select "form[action=?][method=?]", ipv4_address_path(@ipv4_address), "post" do

      assert_select "input#ipv4_address_ipv4_address[name=?]", "ipv4_address[ipv4_address]"

      assert_select "input#ipv4_address_mac_address[name=?]", "ipv4_address[mac_address]"

      assert_select "input#ipv4_address_ptr_record[name=?]", "ipv4_address[ptr_record]"
    end
  end
end
