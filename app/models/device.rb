class Device < ActiveRecord::Base
  #has_one :ad_computer_account

  #has_many :device_ipv4_addresses
  #has_many :ipv4_addresses, through: :device_ipv4_addresses

  validates :hostname, presence: true,
                       length: { in: 1..63, message: 'Hostname must be less than 63 characters' },
                       format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'Hostname must match /[a-zA-Z0-9]/' }
  validates :os, allow_nil: true, allow_blank: true, inclusion: { in: [ 'Centos', 'Cisco', 'F5', 'Ubuntu', 'Windows' ] }
  validates :pci_scope, inclusion: { in: [true,false], message: 'PCI Scope must be true or false' }

  #validates_associated :domain
  #validates_associated :ipv4_address
end
