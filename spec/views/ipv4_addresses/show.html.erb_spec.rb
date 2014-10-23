require 'rails_helper'

RSpec.describe "ipv4_addresses/show", :type => :view do
  before(:each) do
    @ipv4_address = assign(:ipv4_address, IPv4Address.create!(
      :ipv4_address => "IPv4 Address",
      :mac_address => "Mac Address",
      :ptr_record => "Ptr Record"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/IPv4 Address/)
    expect(rendered).to match(/Mac Address/)
    expect(rendered).to match(/Ptr Record/)
  end
end
