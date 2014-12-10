module Cube
  class DeviceResource
    def device_ipv4_addresses(device, params)
      return device unless params.is_a?(Array)
      params.each do |interface|
        next unless interface[:ipv4_address]
        ipv4 = IPv4Address.where(ipv4_address: interface[:ipv4_address]).first
        if ipv4
          device.ipv4_addresses << ipv4 unless device.ipv4_addresses.include?(ipv4)
        else
          device.ipv4_addresses.new(ipv4_address: interface[:ipv4_address])
        end
      end
      device
    end
  end
end
