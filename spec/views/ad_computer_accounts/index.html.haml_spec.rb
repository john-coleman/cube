require 'rails_helper'

RSpec.describe 'ad_computer_accounts/index', type: :view do
  before(:each) do
    assign(:ad_computer_accounts, [
      FactoryGirl.create(:ad_computer_account),
      FactoryGirl.create(:ad_computer_account)
    ])
  end

  it 'renders a list of ad_computer_accounts' do
    render
    assert_select 'tr>td', text: /\A[a-zA-Z0-9-]+\z/, minimum: 2
    assert_select 'tr>td', text: /\A([[:alnum:]-]+\.)*([[:alnum:]-]+)\z/, minimum: 2
    assert_select 'tr>td', text: /\A(OU=[^ #][[:alnum:]\- ]+[^ ],)+(DC=[[:alnum:]\-]+,)+DC=[[:alnum:]\-]+\z/, minimum: 2
  end
end
