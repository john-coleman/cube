require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }
  describe 'GET /users' do
    context 'as anonymous user' do
      it "redirects to '/auth/ldap'" do
        get users_path
        expect(response).to redirect_to('/auth/ldap')
      end
    end
  end
end
