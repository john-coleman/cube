require 'ipaddr'

class IPv4Address < ActiveRecord::Base
  has_many :device_ipv4_addresses
  has_many :devices, through: :device_ipv4_addresses

  validates :ipv4_address, presence: true, uniqueness: true,
    length: { in: 7..15, message: 'IPv4 Address must be less than 15 characters eg. 110.120.130.140'},
    format: { with: /\A([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\z/,
              message: 'IPv4 Address must be 4 octets which are each within range 0-255' }
  validates :mac_address, allow_nil: true, allow_blank: true,
    length: { is: 17, message: 'MAC Address must be 6 colon-separated pairs of uppercase Hex eg. 01:23:89:AB:EE:EF' },
    format: { with: /\A([A-F0-9]{2}:){5}[A-F0-9]{2}\z/,
              message: 'MAC Address must be 6 colon-separated pairs of Hex digits' }
  validates :ptr_record, allow_nil: true, allow_blank: true,
    length: { in: 2..254, message: 'Hostname must be less than 254 characters or 255 octets' },
    format: { with: /\A([a-zA-Z0-9\-]+\.){2,}\z/,
              message: 'PTR Record must be a FQDN ending in root zone "." eg. hostname.domain.' }

  validate :valid_ipv4_address

  before_validation :upcase_mac_address

  def upcase_mac_address
    self.mac_address.upcase!
  end

  def valid_ipv4_address
    begin
      unless IPAddr.new(ipv4_address).ipv4?
        errors[:ipv4_address] << 'Must be a valid IPv4 address'
      end
    rescue IPAddr::InvalidAddressError
      errors[:ipv4_address] << 'Must be a valid IPv4 address'
    end
  end
end
