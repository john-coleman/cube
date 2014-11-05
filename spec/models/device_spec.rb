require 'rails_helper'

RSpec.describe Device, type: :model do
  subject { FactoryGirl.build :device }

  let(:creator) { FactoryGirl.build :user, username: 'box.creator', name: 'Box Creator' }
  let(:owner) { FactoryGirl.build :user, username: 'box.owner', name: 'Box Owner' }
  let(:ipv4_address) { FactoryGirl.build :ipv4_address }
  let(:params) do
    {
      creator_id: creator.id,
      domain: 'a-domain.com',
      hostname: 'a-device-01',
      owner_id: owner.id,
      os: 'Windows',
      pci_scope: true
    }
  end

  describe 'with valid input' do
    subject { FactoryGirl.build :device, params }

    it { is_expected.to be_valid }

    it 'validates mixed-case os value' do
      subject.os = 'WiNdOws'
      is_expected.to be_valid
    end

    describe '#ipv4_address' do
      context 'with ipv4_address' do
        it 'returns ip address' do
          subject.ipv4_addresses << ipv4_address
          expect(subject.ipv4_address).to eq(ipv4_address.ipv4_address)
        end
      end
      context 'without ipv4_address' do
        it 'returns empty string' do
          expect(subject.ipv4_address).to be_blank
        end
      end
    end
  end

  describe 'with invalid input' do
    it 'does not validate domain' do
      subject.domain = '@non-domain.\com'
      expect(subject).to be_invalid
    end

    context 'does not validate hostname' do
      it 'with 64 characters' do
        subject.hostname = 'a' + '1' * 63
        is_expected.to be_invalid
      end

      it 'with invalid characters' do
        subject.hostname = 'an_invalid.hostname!'
        is_expected.to be_invalid
      end
    end

    it 'does not validate os' do
      subject.os = 'Invalid Platform'
      is_expected.to be_invalid
    end

    it 'does not validate pci_scope' do
      subject.pci_scope = 'a string'
      is_expected.to be_invalid
    end
  end

end
