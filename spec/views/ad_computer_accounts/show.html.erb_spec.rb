require 'rails_helper'

RSpec.describe "ad_computer_accounts/show", :type => :view do
  before(:each) do
    @ad_computer_account = assign(:ad_computer_account, ADComputerAccount.create!(
      :domain => "Domain",
      :machine_account => "Machine Account",
      :ou => "Organizational Unit"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Domain/)
    expect(rendered).to match(/Machine Account/)
    expect(rendered).to match(/Organizational Unit/)
  end
end
