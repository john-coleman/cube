require 'rails_helper'

RSpec.describe LdapUsersController, type: :controller do
  context '#index' do
    let(:name) { 'Ted Maul' }
    let(:username) { 'ted.maul' }
    let(:record) { { 'samaccountname' => [username], 'displayname' => [name] } }
    it 'returns LdapResource result' do
      resource = instance_double('LdapResource', all: [record])
      expect(LdapResource).to receive(:new).and_return(resource)
      expect(resource).to receive(:filter_by_name).with(name + '*').and_return(resource)
      get :index, term: name, format: :json
      result = JSON.parse(response.body).first
      expect({ 'value' => username, 'label' => name }.reject { |k, v| result[k] == v }).to be_empty
    end
  end
end
