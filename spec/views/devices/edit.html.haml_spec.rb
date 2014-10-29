require 'rails_helper'

RSpec.describe 'devices/edit', type: :view do
  before(:each) do
    @device = assign(:device, FactoryGirl.create(:device))
  end

  it 'renders the edit device form' do
    render

    assert_select 'form[action=?][method=?]', device_path(@device), 'post' do

      assert_select 'input#device_hostname[name=?]', 'device[hostname]'

      assert_select 'input#device_domain[name=?]', 'device[domain]'

      assert_select 'input#device_os[name=?]', 'device[os]'
    end
  end
end
