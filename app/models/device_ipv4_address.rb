class DeviceIPv4Address < ActiveRecord::Base
  belongs_to :device
  belongs_to :ipv4_address
end
