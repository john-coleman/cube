require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build :user }

  let(:username) { 'some_user_id' }
  let(:user_email) { 'test@example.com' }

  describe '.from_omniauth' do
    let(:omniauth_params) { { 'samaccountname' => [username], 'mail' => [user_email], 'displayname' => ['name'] } }

    context "if user doesn't exist" do
      it 'creates user with id and mail' do
        user = nil
        expect { user = User.from_omniauth(omniauth_params) }.to change { User.count }.by(1)
        expect(user.username).to eq(username)
        expect(user.email).to eq(user_email)
      end
    end

    context 'if user exists' do
      let!(:user) { FactoryGirl.create(:user, username: username) }

      it 'returns existing user' do
        expect { expect(User.from_omniauth(omniauth_params)).to eq(user) }.not_to change { User.count }
      end
    end
  end

  describe '#email' do
    context 'when user has entered email' do
      subject { User.new(email: user_email).email }

      it { is_expected.to eq user_email }
    end

    context "when user hasn't entered email" do
      subject { User.new(username: username).email }

      it 'should be generated from user_name' do
        is_expected.to eq("#{username}@example.com")
      end
    end

    it 'returns lowercase email' do
      expect(User.new(email: 'Test@example.com').email).to eq('test@example.com')
    end
  end
end
