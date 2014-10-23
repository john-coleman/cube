require 'rails_helper'

RSpec.describe "devices/new", :type => :view do
  before(:each) do
    assign(:device, Device.new(
      :hostname => "MyString",
      :domain => "MyString",
      :os => "MyString"
    ))
  end

  it "renders new device form" do
    render

    assert_select "form[action=?][method=?]", devices_path, "post" do

      assert_select "input#device_hostname[name=?]", "device[hostname]"

      assert_select "input#device_domain[name=?]", "device[domain]"

      assert_select "input#device_os[name=?]", "device[os]"
    end
  end
end
