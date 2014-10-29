require 'rails_helper'

RSpec.describe IPv4Address, type: :model do
  subject { FactoryGirl.build :ipv4_address }

  context 'with valid input' do
    subject { FactoryGirl.build :ipv4_address, params }

    let(:params) do
      {
        ipv4_address: '10.20.30.40',
        mac_address: '01:45:89:AB:CD:EF',
        ptr_record: 'a-machine-acc01.a.domain.com.'
      }
    end

    it { is_expected.to be_valid }

    it 'validates mixed-case MAC Address' do
      subject.mac_address = '01:ab:23:CD:45:eF'
      is_expected.to be_valid
    end
  end

  context 'with invalid input' do
    context 'does not validate ipv4_address' do
      it 'with out-of-range octet' do
        subject.ipv4_address = '10.256.300.200'
        expect(subject).to be_invalid
      end

      it 'with 5 octets' do
        subject.ipv4_address = '123.123.123.123.1'
        expect(subject).to be_invalid
      end
    end

    context 'does not validate mac_address' do
      it 'with non-hex characters' do
        subject.mac_address = '01:GH:23:IJ:45:ZZ'
        expect(subject).to be_invalid
      end

      it 'with less than 17 characters' do
        subject.mac_address = '01:GH:23:IJ:45:Z'
        expect(subject).to be_invalid
      end

      it 'with more than 17 characters' do
        subject.mac_address = '01:AB:23:CD:45:EF:'
        expect(subject).to be_invalid
      end

      it 'with Microsoft format hyphen-delimiters' do
        subject.mac_address = '01-45-89-AB-CD-EF'
        expect(subject).to be_invalid
      end

      it 'with Cisco format dotted-delimiters' do
        subject.mac_address = '0145.89ab.cdef'
        expect(subject).to be_invalid
      end
    end

    context 'does not validate ptr_record' do
      it 'without trailing root zone' do
        subject.ptr_record = 'a-machine-acc01.a.domain.com'
        expect(subject).to be_invalid
      end
      it 'with just one component' do
        subject.ptr_record = 'a-machine-acc01.'
        expect(subject).to be_invalid
      end
    end
  end
end
