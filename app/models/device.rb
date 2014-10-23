class Device < ActiveRecord::Base
  has_one :ad_computer_account

  has_many :device_ipv4_address
  has_many :ip_address, through: :device_ipv4_address

  validates :domain, through: :ad_computer_account
  validates :hostname, presence: true,
                       length: { maximum: 63, message: 'Hostname must be less than 63 characters' },
                       format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'Hostname must match /[a-zA-Z0-9]/' }
  validates :platform, inclusion: { in: [ 'Windows', 'Ubuntu', 'Cisco', 'F5' ] }

  validates_associated :ip_address
end
