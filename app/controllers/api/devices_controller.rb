class Api::DevicesController < ApiController
  before_action :set_device, only: [:create]

  respond_to :json

  def create
    @device.ipv4_addresses = create_ipv4_addresses(ipv4_address_params) if ipv4_address_params[:ipv4_address]
    if @device.update(device_params)
      render json: @device.previous_changes.merge(@device.changes || {})
    else
      Rails.logger.error "Device Errors: #{@device.errors}"
      render json: @device.errors, status: :unprocessable_entity
    end
  end

  private

  def set_device
    @device = Device.find_by(hostname: device_params[:hostname], domain: device_params[:domain]) || Device.new(device_params)
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
