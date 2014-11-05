require 'rails_helper'

RSpec.describe 'ad_computer_accounts/new', type: :view do
  before(:each) do
    assign(:ad_computer_account, FactoryGirl.build(:ad_computer_account))
  end

  it 'renders new ad_computer_account form' do
    render
    assert_select 'form[action=?][method=?]', ad_computer_accounts_path, 'post' do
      assert_select 'input#ad_computer_account_domain[name=?]', 'ad_computer_account[domain]'
      assert_select 'input#ad_computer_account_machine_account[name=?]', 'ad_computer_account[machine_account]'
      assert_select 'input#ad_computer_account_ou[name=?]', 'ad_computer_account[ou]'
    end
  end
end
