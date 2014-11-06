class Device < ActiveRecord::Base
  OS_TYPES = %w(centos cisco f5 linux ubuntu windows)

  belongs_to :owner, class_name: 'User'
  belongs_to :creator, class_name: 'User'

  has_one :ad_computer_account

  has_many :device_ipv4_addresses
  has_many :ipv4_addresses, through: :device_ipv4_addresses

  validate :validate_fqdn_uniqueness

  validates :domain, allow_nil: true, allow_blank: true,
                     length: { in: 1..252, message: 'must be between 1-252 characters' },
                     format: { with: /\A([[:alnum:]-]+\.)*([[:alnum:]-]+)\z/,
                               message: 'must be valid domain eg. foo-bar.baz-9-domain.tld' }
  validates :hostname, presence: true,
                       length: { in: 1..63, message: 'must be less than 63 characters' },
                       format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'must match /[a-zA-Z0-9-]+/' }
  validates :os, allow_nil: true, allow_blank: true,
                 inclusion: { in: OS_TYPES, message: "must be one of #{OS_TYPES.join(', ')}" }
  validates :pci_scope, allow_nil: true, allow_blank: true,
                        inclusion: { in: ['true', 'false', true, false], message: "must be 'true' or 'false' at present" }

  # validates_associated :domain
  # validates_associated :ipv4_address

  before_validation :downcase_os

  def downcase_os
    os.downcase!
  end

  def ipv4_address
    return '' unless ipv4_addresses.first
    ipv4_addresses.first.ipv4_address
  end

  def mac_address
    return '' unless ipv4_addresses.first
    ipv4_addresses.first.mac_address
  end

  def ptr_record
    return '' unless ipv4_addresses.first
    ipv4_addresses.first.ipv4_address
  end

  def validate_fqdn_uniqueness
    errors[:device] << "Must be a unique fqdn #{hostname}.#{domain}" if Device.where(
      hostname: hostname, domain: domain).where.not(id: id).exists?
  end
end
