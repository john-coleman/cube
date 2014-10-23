require 'rails_helper'

RSpec.describe "ad_computer_accounts/index", :type => :view do
  before(:each) do
    assign(:ad_computer_accounts, [
      ADComputerAccount.create!(
        :domain => "Domain",
        :machine_account => "Machine Account",
        :ou => "Organizational Unit"
      ),
      ADComputerAccount.create!(
        :domain => "Domain",
        :machine_account => "Machine Account",
        :ou => "Organizational Unit"
      )
    ])
  end

  it "renders a list of ad_computer_accounts" do
    render
    assert_select "tr>td", :text => "Domain".to_s, :count => 2
    assert_select "tr>td", :text => "Machine Account".to_s, :count => 2
    assert_select "tr>td", :text => "Organizational Unit".to_s, :count => 2
  end
end
