require 'rails_helper'

RSpec.describe Device, :type => :model do
  subject { FactoryGirl.build :device }

  context 'with valid input' do
    subject { FactoryGirl.build :device, params }

    #let(:creator) { FactoryGirl.build :user, username: 'box.creator', name: 'Box Creator' }
    #let(:owner) { FactoryGirl.build :user, username: 'box.owner', name: 'Box Owner' }
    let(:params) {
      {
        # creator: creator.username,
        hostname: 'a-device-01',
        # owner: owner.username,
        os: 'Windows',
        pci_scope: true
      }
    }

    it { is_expected.to be_valid }
  end

  context 'with invalid input' do
    context 'does not validate hostname' do
      it 'with 64 characters' do
        subject.hostname = 'a' + '1'*63
        is_expected.to be_invalid
      end

      it 'with invalid characters' do
        subject.hostname = 'an_invalid.hostname!'
        is_expected.to be_invalid
      end
    end

    it 'does not validate os' do
      subject.os ='Invalid Platform'
      is_expected.to be_invalid
    end

    it 'does not validate pci_scope' do
      subject.pci_scope = 'a string'
      is_expected.to be_invalid
    end
  end
end
