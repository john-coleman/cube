require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, FactoryGirl.create(:user))
  end

  it 'renders the edit user form' do
    render
    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input#user_username[name=?]', 'user[username]'
      assert_select 'input#user_name[name=?]', 'user[name]'
      assert_select 'input#user_email[name=?]', 'user[email]'
    end
  end
end
