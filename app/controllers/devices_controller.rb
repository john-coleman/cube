class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)
    @device.ipv4_addresses = create_ipv4_addresses(ipv4_address_params) if ipv4_address_params[:ipv4_address]
    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    @device.ipv4_addresses = create_ipv4_addresses(ipv4_address_params) if ipv4_address_params[:ipv4_address]
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

  # DELETE /devices/1
  # DELETE /devices/1.json
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

  def create_ipv4_addresses(attributes)
    if attributes[:ipv4_address]
      device_ip = IPv4Address.where(ipv4_address: attributes[:ipv4_address]).first
      device_ip = IPv4Address.new(ipv4_address: attributes[:ipv4_address],
                                  mac_address: attributes[:mac_address] || nil,
                                  ptr_record: attributes[:ptr_record] || nil) if device_ip.nil?
      device_ip.save
      [device_ip]
    else
      []
    end
  end

  def device_ipv4_address_params
    params.require(:device).permit(:hostname, :domain, :os, :pci_scope, :ipv4_address, :mac_address, :ptr_record)
  end

  def device_params
    device_ipv4_address_params.select do |key, _val|
      %w(hostname domain os pci_scope).include?(key.to_s)
    end
  end

  def ipv4_address_params
    device_ipv4_address_params.select do |key, _val|
      %w(ipv4_address mac_address ptr_record).include?(key.to_s)
    end
  end
end
