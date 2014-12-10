module Cube
  class DeviceResource
    def device_ipv4_addresses(device, params)
      return device unless params.is_a?(Array)
      params.each do |interface|
        next unless interface[:ipv4_address]
        new_ipv4 = IPv4Address.where(ipv4_address: interface[:ipv4_address]).first_or_create
        if new_ipv4.invalid?
          device.errors.messages[interface[:ipv4_address]] = new_ipv4.errors
        end
        device.ipv4_addresses << new_ipv4 unless device.ipv4_addresses.include?(new_ipv4)
      end
      device
    end
  end
end
