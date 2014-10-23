class ADComputerAccountsController < ApplicationController
  before_action :set_ad_computer_account, only: [:show, :edit, :update, :destroy]

  # GET /ad_computer_accounts
  # GET /ad_computer_accounts.json
  def index
    @ad_computer_accounts = ADComputerAccount.all
  end

  # GET /ad_computer_accounts/1
  # GET /ad_computer_accounts/1.json
  def show
  end

  # GET /ad_computer_accounts/new
  def new
    @ad_computer_account = ADComputerAccount.new
  end

  # GET /ad_computer_accounts/1/edit
  def edit
  end

  # POST /ad_computer_accounts
  # POST /ad_computer_accounts.json
  def create
    @ad_computer_account = ADComputerAccount.new(ad_computer_account_params)

    respond_to do |format|
      if @ad_computer_account.save
        format.html { redirect_to @ad_computer_account, notice: 'AD computer account was successfully created.' }
        format.json { render :show, status: :created, location: @ad_computer_account }
      else
        format.html { render :new }
        format.json { render json: @ad_computer_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_computer_accounts/1
  # PATCH/PUT /ad_computer_accounts/1.json
  def update
    respond_to do |format|
      if @ad_computer_account.update(ad_computer_account_params)
        format.html { redirect_to @ad_computer_account, notice: 'AD computer account was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad_computer_account }
      else
        format.html { render :edit }
        format.json { render json: @ad_computer_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_computer_accounts/1
  # DELETE /ad_computer_accounts/1.json
  def destroy
    @ad_computer_account.destroy
    respond_to do |format|
      format.html { redirect_to ad_computer_accounts_url, notice: 'AD computer account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_computer_account
      @ad_computer_account = ADComputerAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_computer_account_params
      params.require(:ad_computer_account).permit(:domain, :machine_account, :ou)
    end
end
