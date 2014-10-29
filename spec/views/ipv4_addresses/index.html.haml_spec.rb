require 'rails_helper'

RSpec.describe 'ipv4_addresses/index', type: :view do
  before(:each) do
    assign(:ipv4_addresses, [
      FactoryGirl.create(:ipv4_address),
      FactoryGirl.create(:ipv4_address)
    ])
  end

  it 'renders a list of ipv4_addresses' do
    render
    assert_select 'tr>td', text: /\A((1?\d\d?|2[0-4]\d|25[0-5])\.){3}(1?\d\d?|2[0-4]\d|25[0-5])\z/, count: 2
    assert_select 'tr>td', text: /\A([A-F0-9]{2}:){5}[A-F0-9]{2}\z/, count: 2
    assert_select 'tr>td', text: 'a.ptr.record.'.to_s, count: 2
  end
end
