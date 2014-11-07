require 'rails_helper'

RSpec.describe 'IPv4Addresses', type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }
  describe 'GET /ipv4_addresses' do
    context 'as anonymous user' do
      it "redirects to '/auth/ldap'" do
        get ipv4_addresses_path, {}, valid_session
        expect(response).to redirect_to('/auth/ldap')
      end
    end
  end
end
