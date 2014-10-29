require 'rails_helper'

RSpec.describe ADComputerAccount, type: :model do
  subject { FactoryGirl.build :ad_computer_account }

  context 'with valid input' do
    subject { FactoryGirl.build :ad_computer_account, params }

    let(:params) do
      {
        domain: 'a.domain.com',
        machine_account: 'a-machine-acc01',
        ou: 'OU=Foo,OU=Computers,DC=a,DC=domain,DC=com'
      }
    end

    it { is_expected.to be_valid }
  end

  context 'with invalid input' do
    it 'does not validate domain' do
      subject.domain = '@non-domain.\com'
      expect(subject).to be_invalid
    end

    it 'does not validate machine_account' do
      subject.machine_account = '@-bad-machine-account'
      expect(subject).to be_invalid
    end

    it 'does not validate ou' do
      subject.ou = 'OU= Foo+Fighters,OU=#Computers,DC=@,DC=non-domain,DC=\com'
      expect(subject).to be_invalid
    end
  end
end
