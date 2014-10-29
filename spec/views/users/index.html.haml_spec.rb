require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
      FactoryGirl.create(:user),
      FactoryGirl.create(:user)
    ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: /username\d+/, minimum: 2
    assert_select 'tr>td', text: /Username\d+/, minimum: 2
    assert_select 'tr>td', text: /username\d+@wonga\.com/, minimum: 2
  end
end
