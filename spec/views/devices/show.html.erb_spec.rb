require 'rails_helper'

RSpec.describe "devices/show", :type => :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :hostname => "Hostname",
      :domain => "Domain",
      :os => "Os"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Hostname/)
    expect(rendered).to match(/Domain/)
    expect(rendered).to match(/Os/)
  end
end
