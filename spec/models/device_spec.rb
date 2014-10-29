require 'rails_helper'

RSpec.describe Device, type: :model do
  subject { FactoryGirl.build :device }

  context 'with valid input' do
    subject { FactoryGirl.build :device, params }

    let(:creator) { FactoryGirl.build :user, username: 'box.creator', name: 'Box Creator' }
    let(:owner) { FactoryGirl.build :user, username: 'box.owner', name: 'Box Owner' }
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

    it { is_expected.to be_valid }
  end

  context 'with invalid input' do
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
