class ADComputerAccount < ActiveRecord::Base
  belongs_to :device, inverse_of: :ad_computer_account

  validates :domain, presence: true,
                     length: { in: 1..252, message: 'must be between 1-252 characters' },
                     format: { with: /\A([[:alnum:]-]+\.)*([[:alnum:]-]+)\z/, message: 'must be valid domain eg. foo-bar.baz0.tld' }
  validates :machine_account, presence: true, uniqueness: true,
                              length: { in: 1..15, message: 'must be less than 15 characters' },
                              format: { with: /\A[a-zA-Z0-9-]+\z/, message: 'must match RegEx /[a-zA-Z0-9-]+/' }
  validates :ou, presence: true,
                 format: { with: /\A(OU=[^ #][[:alnum:]\- ]+[^ ],)+(DC=[[:alnum:]\-]+,)+DC=[[:alnum:]\-]+\z/,
                           message: 'must be BaseDN format eg. OU=Team,OU=Dept,DC=domain,DC=com' }
end
