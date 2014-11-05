require 'rails_helper'

RSpec.describe 'devices/show', type: :view do
  before(:each) do
    @device = assign(:device, FactoryGirl.create(:device, :with_ipv4_address))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Hostname/)
    expect(rendered).to match(@device.hostname)
    expect(rendered).to match(/Domain/)
    expect(rendered).to match(@device.domain)
    expect(rendered).to match(/OS/)
    expect(rendered).to match(@device.os)
    expect(rendered).to match(/IPv4 Address/)
    expect(rendered).to match(@device.ipv4_address)
    expect(rendered).to match(/Creator/)
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Updated/)
  end
end
