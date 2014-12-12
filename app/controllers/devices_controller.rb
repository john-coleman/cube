class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = Device.all
  end

  def show
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def create
    @device = Device.new(device_params)
    @device.save
    Cube::DeviceResource.new.device_ipv4_addresses(@device, device_ipv4_params) if device_ipv4_params
    respond_to do |format|
      if @device.persisted?
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    Cube::DeviceResource.new.device_ipv4_addresses(@device, device_ipv4_params) if device_ipv4_params
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_ipv4_params
    params[:ipv4_addresses]
  end

  def device_params
    params.require(:device).permit(:hostname, :domain, :os, :pci_scope, :ipv4_addresses)
  end
end
