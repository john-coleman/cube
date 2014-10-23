class IPv4Address < ActiveRecord::Base
  belongs_to :device_ipv4_address

  validates :ipv4_address, presence: true,
                           uniqueness: true,
                           length: { maximum: 15, message: 'IPv4 Address must be less than 15 characters eg. 110.120.130.140'},
                           format: { with: /\A([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\z/,
                                     message: 'IPv4 Address must be 4 octets which are each within range 0-255' }
  validates :mac_address, length: {maximum: 17, message: 'MAC Address must be less than 17 characters eg. 01:23:45:56:78:9A' },
                          format: { with: /\A[\h]{2}:[\h]{2}:[\h]{2}:[\h]{2}:[\h]{2}:[\h]{2}\z/,
                                    message: 'MAC Address must be 6 colon-separated pairs of Hex digits'}
  validates :ptr_record, length: { maximum: 254, message: 'Hostname must be less than 254 characters or 255 octets' },
                         format: { with: /\A([a-zA-Z0-9\-]+\.[a-zA-Z0-9\-]+)([a-zA-Z0-9\-.]*)\z/, message: 'Hostname must match /[a-zA-Z0-9]/' }
end
