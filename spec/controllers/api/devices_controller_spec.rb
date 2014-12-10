require 'rails_helper'

RSpec.describe Api::DevicesController, type: :controller do
  let(:attributes) do
    {
      domain: 'a-domain.com',
      hostname: 'a-device-01',
      os: 'Windows',
      pci_scope: 'true'
    }
  end
  let(:invalid_attributes) do
    {
      domain: '@non-domain.\com',
      hostname: 'an_invalid.hostname!',
      os: 'AIX',
      pci_scope: 'maybe?'
    }
  end
  let(:ipv4) { FactoryGirl.build :ipv4_address }
  let(:ipv4_attributes) { [{ ipv4_address: ipv4.ipv4_address, mac_address: ipv4.mac_address }] }
  let(:valid_session) { {} }

  describe 'POST create' do
    context 'without valid token' do
      before(:each) do
        request.headers['X-Auth-Token'] = 'invalid'
      end

      it 'request is unauthorized' do
        post :create, device: attributes, format: :json
        expect(response.status).to eq(401)
      end
    end

    context 'with valid token' do
      before(:each) do
        request.headers['X-Auth-Token'] = CONFIG['cube']['api_key']
      end

      context 'a new device' do
        context 'with valid params' do
          it 'creates a new Device' do
            expect do
              post :create, device: attributes, format: :json
            end.to change(Device, :count).by(1)
          end

          it 'assigns a newly created device as @device' do
            post :create, device: attributes, format: :json
            expect(assigns(:device)).to be_a(Device)
            expect(assigns(:device)).to be_persisted
          end

          it 'returns device updates as json' do
            post :create, device: attributes, format: :json
            expect(response.status).to be(200)
            expect(response.body).to eq(assigns(:device).previous_changes.to_json)
          end

          context 'with valid params with ipv4_address' do
            it 'creates a new IPv4Address' do
              expect do
                post :create, device: attributes, ipv4_addresses: ipv4_attributes, format: :json
              end.to change(IPv4Address, :count).by(1)
            end

            it 'returns device updates as json' do
              post :create, device: attributes, ipv4_addresses: ipv4_attributes, format: :json
              expect(response.status).to be(200)
              expect(response.body).to eq(assigns(:device).previous_changes.to_json)
            end
          end
        end
      end

      context 'an existing device' do
        let(:existing_device) { FactoryGirl.create :device, :windows }
        let(:attributes) do
          {
            hostname: existing_device.hostname,
            domain: existing_device.domain,
            os: existing_device.os
          }
        end

        context 'with valid params' do
          let(:updated_attributes) { attributes.merge(os: 'linux') }

          it 'does not create a new Device' do
            existing_device
            expect do
              post :create, device: updated_attributes, format: :json
            end.to_not change(Device, :count)
          end

          it 'assigns existing device as @device' do
            existing_device
            post :create, device: updated_attributes, format: :json
            expect(assigns(:device)).to eq(existing_device)
            expect(assigns(:device)).to be_persisted
          end

          it 'returns device updates as json' do
            existing_device
            post :create, device: updated_attributes, format: :json
            expect(response.status).to be(200)
            expect(response.body).to eq(assigns(:device).previous_changes.to_json)
          end

          context 'with ipv4_address' do
            it 'creates a new IPv4Address' do
              existing_device
              expect do
                post :create, device: updated_attributes, ipv4_addresses: ipv4_attributes, format: :json
              end.to change(IPv4Address, :count).by(1)
            end

            it 'returns device updates as json' do
              post :create, device: updated_attributes, ipv4_addresses: ipv4_attributes, format: :json
              expect(response.status).to be(200)
              expect(response.body).to eq(assigns(:device).previous_changes.to_json)
            end
          end
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved device as @device' do
          post :create, { device: invalid_attributes, ipv4_addresses: ipv4_attributes }, format: :json
          expect(assigns(:device)).to be_a_new(Device)
        end

        it "returns 'HTTP 422 Unprocessable Entity'" do
          post :create, { device: invalid_attributes, ipv4_addresses: ipv4_attributes }, format: :json
          expect(response.status).to eq(422)
        end
      end

      context 'with invalid IPv4 params' do
        let(:ipv4_attributes) { [{ ipv4_address: 'not.an.ip.address', mac_address: 'not.a.mac.address' }] }

        it 'raises validation error' do
          expect do
            post :create, { device: attributes, ipv4_addresses: ipv4_attributes }, format: :json
          end.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
