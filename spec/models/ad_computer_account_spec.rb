require 'rails_helper'

RSpec.describe ADComputerAccount, :type => :model do
  subject { FactoryGirl.build :ad_computer_account }

  context 'with valid input' do
    let(:valid_message) {
      {
        domain: 'a.domain.com',
        machine_account: 'a-machine-acc01',
        ou: 'OU=Foo,OU=Computers,DC=a,DC=domain,DC=com'
      }
    }

    it 'validates domain' do

    end

    it 'validates machine_account' do

    end

    it 'validates ou' do

    end
    
    it 'saves record'
  end

  context 'with invalid input' do
    let(:invalid_message) {
      {
        domain: 'a.domain.com',
        machine_account: 'a-machine-acc01',
        ou: 'OU=Foo,OU=Computers,DC=a,DC=domain,DC=com'
      }
    }

    it 'does not validate domain' do

    end

    it 'does not validate machine_account' do

    end

    it 'does not validate ou' do

    end
  end
end
