require 'rails_helper'

RSpec.describe 'ipv4_addresses/show', type: :view do
  before(:each) do
    @ipv4_address = assign(:ipv4_address, FactoryGirl.create(:ipv4_address))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/IPv4 Address/)
    expect(rendered).to match(/MAC Address/)
    expect(rendered).to match(/PTR Record/)
  end
end
