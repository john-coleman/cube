require 'rails_helper'

RSpec.describe "devices/index", :type => :view do
  before(:each) do
    assign(:devices, [
      Device.create!(
        :hostname => "Hostname",
        :domain => "Domain",
        :os => "Os"
      ),
      Device.create!(
        :hostname => "Hostname",
        :domain => "Domain",
        :os => "Os"
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => "Hostname".to_s, :count => 2
    assert_select "tr>td", :text => "Domain".to_s, :count => 2
    assert_select "tr>td", :text => "Os".to_s, :count => 2
  end
end
