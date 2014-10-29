require 'rails_helper'

RSpec.describe 'IPv4Addresses', type: :request do
  describe 'GET /ipv4_addresses' do
    it 'works! (now write some real specs)' do
      get ipv4_addresses_path
      expect(response.status).to be(200)
    end
  end
end
