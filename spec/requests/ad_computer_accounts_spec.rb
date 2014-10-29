require 'rails_helper'

RSpec.describe 'ADComputerAccounts', type: :request do
  describe 'GET /ad_computer_accounts' do
    it 'works! (now write some real specs)' do
      get ad_computer_accounts_path
      expect(response.status).to be(200)
    end
  end
end
