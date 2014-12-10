require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  let(:attributes) do
    {
      domain: 'a-domain.com',
      hostname: 'a-device-01',
      os: 'Windows',
      pci_scope: 'true'
    }
  end
  let(:creator) { FactoryGirl.build :user, username: 'box.creator', name: 'Box Creator' }
  let(:device) { FactoryGirl.create :device, attributes }
  let(:invalid_attributes) do
    {
      domain: '@non-domain.\com',
      hostname: 'an_invalid.hostname!',
      os: 'AIX',
      pci_scope: 'maybe?'
    }
  end
  let(:ipv4) { FactoryGirl.build :ipv4_address }
  let(:ipv4_attributes) { [ipv4_address: ipv4.ipv4_address, mac_address: ipv4.mac_address] }
  let(:owner) { FactoryGirl.build :user, username: 'box.owner', name: 'Box Owner' }
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { { user_id: user.id } }

  describe 'GET index' do
    it 'assigns all devices as @devices' do
      device
      get :index, {}, valid_session
      expect(assigns(:devices)).to eq([device])
    end
  end

  describe 'GET show' do
    it 'assigns the requested device as @device' do
      device
      get :show, { id: device.to_param }, valid_session
      expect(assigns(:device)).to eq(device)
    end
  end

  describe 'GET new' do
    it 'assigns a new device as @device' do
      get :new, {}, valid_session
      expect(assigns(:device)).to be_a_new(Device)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested device as @device' do
      device
      get :edit, { id: device.to_param }, valid_session
      expect(assigns(:device)).to eq(device)
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      it 'creates a new Device' do
        expect do
          post :create, { device: attributes }, valid_session
        end.to change(Device, :count).by(1)
      end

      it 'assigns a newly created device as @device' do
        post :create, { device: attributes }, valid_session
        expect(assigns(:device)).to be_a(Device)
        expect(assigns(:device)).to be_persisted
      end

      it 'redirects to the created device' do
        post :create, { device: attributes }, valid_session
        expect(response).to redirect_to(Device.last)
      end
    end

    context 'with valid params with ipv4_address' do
      it 'creates a new Device' do
        expect do
          post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        end.to change(Device, :count).by(1)
      end

      it 'creates a new IPv4Address' do
        expect do
          post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        end.to change(IPv4Address, :count).by(1)
      end

      it 'assigns a newly created device as @device' do
        post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device)).to be_a(Device)
      end

      it 'persists a newly created device' do
        post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device)).to be_persisted
      end

      it 'redirects to the created device' do
        post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(response).to redirect_to(Device.last)
      end
    end

    context 'with invalid params' do
      let(:ipv4_attributes) { [{ ipv4_address: 'not.an.ip.address', mac_address: 'not.a.mac.address' }] }

      it 'assigns a newly initialized but unsaved device as @device' do
        post :create, { device: invalid_attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device)).to be_a_new(Device)
      end

      it "re-renders the 'new' template" do
        post :create, { device: invalid_attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end

    context 'with invalid IPv4 params' do
      let(:ipv4_attributes) { [{ ipv4_address: 'not.an.ip.address', mac_address: 'not.a.mac.address' }] }

      it 'device is invalid' do
        post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device)).to be_invalid
      end

      it 'ipv4_address is not persisted' do
        post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device).ipv4_addresses.last).to_not be_persisted
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          domain: 'new-domain.com',
          hostname: 'new-device-01',
          os: 'Cisco',
          pci_scope: 'true'
        }
      end

      it 'updates the requested device' do
        device
        put :update, { id: device.to_param, device: new_attributes }, valid_session
        device.reload
        expect(device.domain).to eq(new_attributes[:domain])
        expect(device.hostname).to eq(new_attributes[:hostname])
        expect(device.os).to eq(new_attributes[:os])
        expect(device.pci_scope).to eq(new_attributes[:pci_scope])
      end

      it 'assigns the requested device as @device' do
        device
        put :update, { id: device.to_param, device: new_attributes }, valid_session
        expect(assigns(:device)).to eq(device)
      end

      it 'redirects to the device' do
        device
        put :update, { id: device.to_param, device: new_attributes }, valid_session
        expect(response).to redirect_to(device)
      end

      context 'with valid params with ipv4_address' do
        let(:new_ipv4) { FactoryGirl.build :ipv4_address }
        let(:new_ipv4_attributes) do
          [
            { ipv4_address: new_ipv4.ipv4_address, mac_address: new_ipv4.mac_address }
          ]
        end

        it 'updates the requested device' do
          device
          put :update, { id: device.to_param, device: new_attributes, ipv4_addresses: new_ipv4_attributes }, valid_session
          device.reload
          expect(device.domain).to eq(new_attributes[:domain])
          expect(device.hostname).to eq(new_attributes[:hostname])
          expect(device.os).to eq(new_attributes[:os])
          expect(device.pci_scope).to eq(new_attributes[:pci_scope])
          expect(device.ipv4_address).to eq(new_ipv4_attributes.first[:ipv4_address])
        end
      end
    end

    context 'with invalid params' do
      it 'assigns the device as @device' do
        device
        put :update, { id: device.to_param, device: invalid_attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device)).to eq(device)
      end

      it "re-renders the 'edit' template" do
        device
        put :update, { id: device.to_param, device: invalid_attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end

    context 'with invalid IPv4 params' do
      let(:ipv4_attributes) { [{ ipv4_address: 'not.an.ip.address', mac_address: 'not.a.mac.address' }] }

      it 'does not validate device' do
        device
        put :update, { id: device.to_param, device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device)).to be_invalid
      end

      it "re-renders the 'edit' template" do
        device
        put :update, { id: device.to_param, device: attributes, ipv4_addresses: ipv4_attributes }, valid_session
        expect(assigns(:device)).to be_invalid
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do

    it 'destroys the requested device' do
      device
      expect do
        delete :destroy, { id: device.to_param }, valid_session
      end.to change(Device, :count).by(-1)
    end

    it 'redirects to the devices list' do
      device
      delete :destroy, { id: device.to_param }, valid_session
      expect(response).to redirect_to(devices_url)
    end
  end
end
