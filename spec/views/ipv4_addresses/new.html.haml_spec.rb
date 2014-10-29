require 'rails_helper'

RSpec.describe 'ipv4_addresses/new', type: :view do
  before(:each) do
    assign(:ipv4_address, FactoryGirl.build(:ipv4_address))
  end

  it 'renders new ipv4_address form' do
    render

    assert_select 'form[action=?][method=?]', ipv4_addresses_path, 'post' do

      assert_select 'input#ipv4_address_ipv4_address[name=?]', 'ipv4_address[ipv4_address]'

      assert_select 'input#ipv4_address_mac_address[name=?]', 'ipv4_address[mac_address]'

      assert_select 'input#ipv4_address_ptr_record[name=?]', 'ipv4_address[ptr_record]'
    end
  end
end
