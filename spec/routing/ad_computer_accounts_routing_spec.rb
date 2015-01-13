require 'rails_helper'

RSpec.describe ADComputerAccountsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/ad_computer_accounts').to route_to('ad_computer_accounts#index')
    end

    it 'routes to #new' do
      expect(get: '/ad_computer_accounts/new').to route_to('ad_computer_accounts#new')
    end

    it 'routes to #show' do
      expect(get: '/ad_computer_accounts/1').to route_to('ad_computer_accounts#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/ad_computer_accounts/1/edit').to route_to('ad_computer_accounts#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/ad_computer_accounts').to route_to('ad_computer_accounts#create')
    end

    it 'routes to #update' do
      expect(put: '/ad_computer_accounts/1').to route_to('ad_computer_accounts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/ad_computer_accounts/1').to route_to('ad_computer_accounts#destroy', id: '1')
    end
  end
end
