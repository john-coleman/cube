require 'rails_helper'

RSpec.describe Cube::DeviceResource do
  let(:device) { FactoryGirl.create(:device) }
  let(:ipv4) { FactoryGirl.build :ipv4_address }
  let(:params) { [{ ipv4_address: ipv4.ipv4_address, mac_address: ipv4.mac_address }] }

  describe '#device_ipv4_addresses' do
    context 'with new IPv4 address params' do
      it 'associates ipv4_address' do
        subject.device_ipv4_addresses(device, params)
        expect(device.ipv4_addresses.last[:ipv4_address]).to eq(ipv4[:ipv4_address])
      end

      it 'does not persist new ipv4_address' do
        subject.device_ipv4_addresses(device, params)
        expect(device.ipv4_addresses.last).to_not be_persisted
      end

      it 'does not create new ipv4_address' do
        expect { subject.device_ipv4_addresses(device, params) }.to_not change(IPv4Address, :count)
      end
    end

    context 'with existing IPv4 address params' do
      before(:each) do
        ipv4.save
      end

      it 'does not create new ipv4_address' do
        expect { subject.device_ipv4_addresses(device, params) }.to_not change(IPv4Address, :count)
      end

      it 'associates ipv4_address' do
        subject.device_ipv4_addresses(device, params)
        expect(device.ipv4_addresses.last[:ipv4_address]).to eq(ipv4[:ipv4_address])
      end

      it 'existing ipv4_address is persisted' do
        subject.device_ipv4_addresses(device, params)
        expect(device.ipv4_addresses.last).to be_persisted
      end
    end

    context 'with invalid IPv4 address params' do
      let(:params) { [{ ipv4_address: 'not.an.ip.address', mac_address: 'not.a.mac.address' }] }

      it 'ipv4_address is invalid' do
        subject.device_ipv4_addresses(device, params)
        expect(device).to be_invalid
      end
    end

    context 'without IPv4 address params' do
      let(:params) { [] }

      it 'does not create ipv4_address' do
        expect { subject.device_ipv4_addresses(device, params) }.to_not change(IPv4Address, :count)
      end

      it 'does not associate ipv4_address' do
        expect { subject.device_ipv4_addresses(device, params) }.to_not change(device.ipv4_addresses, :count)
      end
    end

    context 'with non-array params' do
      let(:params) { nil }
      it 'returns device' do
        expect(subject.device_ipv4_addresses(device, params)).to be(device)
      end
    end
  end
end
