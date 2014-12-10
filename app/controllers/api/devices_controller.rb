class Api::DevicesController < ApiController
  before_action :set_device, only: [:create]

  respond_to :json

  def create
    @device.save unless @device.persisted?
    Cube::DeviceResource.new.device_ipv4_addresses(@device, device_ipv4_params) if device_ipv4_params
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

  def device_ipv4_params
    params[:ipv4_addresses]
  end

  def device_params
    params.require(:device).permit(:hostname, :domain, :os, :pci_scope)
  end
end
