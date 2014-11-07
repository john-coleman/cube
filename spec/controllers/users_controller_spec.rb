require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user, valid_attributes) }
  let(:valid_attributes) do
    {
      email: 'valid.user@email.address',
      username: 'valid.user'
    }
  end
  let(:invalid_attributes) do
    {
      email: '!invalid.email.address',
      username: '!invalid.user'
    }
  end
  let(:valid_session) { { user_id: user.id } }

  describe 'GET index' do
    it 'assigns all users as @users' do
      get :index, {}, valid_session
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET show' do
    it 'assigns the requested user as @user' do
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET new' do
    it 'assigns a new user as @user' do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested user as @user' do
      get :edit, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { email: 'valid.user@other.address' }
      end

      it 'updates the requested user' do
        put :update, { id: user.to_param, user: new_attributes }, valid_session
        user.reload
        expect(user.email).to eq(new_attributes[:email])
      end

      it 'assigns the requested user as @user' do
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 'redirects to the user' do
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(response).to redirect_to(user)
      end
    end

    describe 'with invalid params' do
      it 'assigns the user as @user' do
        put :update, { id: user.to_param, user: invalid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, { id: user.to_param, user: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end
end
