require 'rails_helper'

RSpec.describe 'devices/index', type: :view do
  before(:each) do
    assign(:devices, [
      FactoryGirl.create(:device, :with_ipv4_address),
      FactoryGirl.create(:device, :with_ipv4_address)
    ])
  end

  it 'renders a list of devices' do
    render
    assert_select 'tr>td', text: /\A[a-zA-Z0-9-]+\z/, minimum: 2
    assert_select 'tr>td', text: /\A([[:alnum:]-]+\.)*([[:alnum:]-]+)\z/, minimum: 2
    assert_select 'tr>td', text: /(centos|cisco|f5|linux|ubuntu|windows)/, minimum: 2
    assert_select 'tr>td', text: /\A((1?\d\d?|2[0-4]\d|25[0-5])\.){3}(1?\d\d?|2[0-4]\d|25[0-5])\z/, minimum: 2
  end
end
