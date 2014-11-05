require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ADComputerAccountsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ADComputerAccount. As you add validations to ADComputerAccount, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      domain: 'ad.domain.com',
      machine_account: 'a-machine-acc01',
      ou: 'OU=Foo,OU=Computers,DC=a,DC=domain,DC=com'
    }
  end

  let(:invalid_attributes) do
    {
      domain: '@.domain.com!',
      machine_account: '@_machine-acc01',
      ou: 'OU=#Foo,OU= Computers,DC=a,DC=domain,OU=com'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ADComputerAccountsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all ad_computer_accounts as @ad_computer_accounts' do
      ad_computer_account = ADComputerAccount.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:ad_computer_accounts)).to eq([ad_computer_account])
    end
  end

  describe 'GET show' do
    it 'assigns the requested ad_computer_account as @ad_computer_account' do
      ad_computer_account = ADComputerAccount.create! valid_attributes
      get :show, { id: ad_computer_account.to_param }, valid_session
      expect(assigns(:ad_computer_account)).to eq(ad_computer_account)
    end
  end

  describe 'GET new' do
    it 'assigns a new ad_computer_account as @ad_computer_account' do
      get :new, {}, valid_session
      expect(assigns(:ad_computer_account)).to be_a_new(ADComputerAccount)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested ad_computer_account as @ad_computer_account' do
      ad_computer_account = ADComputerAccount.create! valid_attributes
      get :edit, { id: ad_computer_account.to_param }, valid_session
      expect(assigns(:ad_computer_account)).to eq(ad_computer_account)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new ADComputerAccount' do
        expect do
          post :create, { ad_computer_account: valid_attributes }, valid_session
        end.to change(ADComputerAccount, :count).by(1)
      end

      it 'assigns a newly created ad_computer_account as @ad_computer_account' do
        post :create, { ad_computer_account: valid_attributes }, valid_session
        expect(assigns(:ad_computer_account)).to be_a(ADComputerAccount)
        expect(assigns(:ad_computer_account)).to be_persisted
      end

      it 'redirects to the created ad_computer_account' do
        post :create, { ad_computer_account: valid_attributes }, valid_session
        expect(response).to redirect_to(ADComputerAccount.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved ad_computer_account as @ad_computer_account' do
        post :create, { ad_computer_account: invalid_attributes }, valid_session
        expect(assigns(:ad_computer_account)).to be_a_new(ADComputerAccount)
      end

      it "re-renders the 'new' template" do
        post :create, { ad_computer_account: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        {
          domain: 'foo.domain.com',
          machine_account: 'b-machine-acc01',
          ou: 'OU=Bar,OU=Computers,DC=a,DC=domain,DC=com'
        }
      end

      it 'updates the requested ad_computer_account' do
        ad_computer_account = ADComputerAccount.create! valid_attributes
        put :update, { id: ad_computer_account.to_param, ad_computer_account: new_attributes }, valid_session
        ad_computer_account.reload
        expect(ad_computer_account.domain).to eq(new_attributes[:domain])
        expect(ad_computer_account.machine_account).to eq(new_attributes[:machine_account])
        expect(ad_computer_account.ou).to eq(new_attributes[:ou])
      end

      it 'assigns the requested ad_computer_account as @ad_computer_account' do
        ad_computer_account = ADComputerAccount.create! valid_attributes
        put :update, { id: ad_computer_account.to_param, ad_computer_account: new_attributes }, valid_session
        expect(assigns(:ad_computer_account)).to eq(ad_computer_account)
      end

      it 'redirects to the ad_computer_account' do
        ad_computer_account = ADComputerAccount.create! valid_attributes
        put :update, { id: ad_computer_account.to_param, ad_computer_account: new_attributes }, valid_session
        expect(response).to redirect_to(ad_computer_account)
      end
    end

    describe 'with invalid params' do
      it 'assigns the ad_computer_account as @ad_computer_account' do
        ad_computer_account = ADComputerAccount.create! valid_attributes
        put :update, { id: ad_computer_account.to_param, ad_computer_account: invalid_attributes }, valid_session
        expect(assigns(:ad_computer_account)).to eq(ad_computer_account)
      end

      it "re-renders the 'edit' template" do
        ad_computer_account = ADComputerAccount.create! valid_attributes
        put :update, { id: ad_computer_account.to_param, ad_computer_account: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested ad_computer_account' do
      ad_computer_account = ADComputerAccount.create! valid_attributes
      expect do
        delete :destroy, { id: ad_computer_account.to_param }, valid_session
      end.to change(ADComputerAccount, :count).by(-1)
    end

    it 'redirects to the ad_computer_accounts list' do
      ad_computer_account = ADComputerAccount.create! valid_attributes
      delete :destroy, { id: ad_computer_account.to_param }, valid_session
      expect(response).to redirect_to(ad_computer_accounts_url)
    end
  end

end
