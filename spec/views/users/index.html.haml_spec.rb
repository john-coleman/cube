require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
      FactoryGirl.create(:user, name: 'Factory Girl Username'),
      FactoryGirl.create(:user, name: 'Factory Girl Username')
    ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: /username\d+/, minimum: 2
    assert_select 'tr>td', text: /Factory Girl Username/, minimum: 2
    assert_select 'tr>td', text: /username\d+@\w+/, minimum: 2
  end
end
