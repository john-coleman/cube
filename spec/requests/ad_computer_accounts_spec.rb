require 'rails_helper'

RSpec.describe 'ADComputerAccounts', type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }
  describe 'GET /ad_computer_accounts' do
    context 'as anonymous user' do
      it "redirects to '/auth/ldap'" do
        get ad_computer_accounts_path
        expect(response).to redirect_to('/auth/ldap')
      end
    end
  end
end
