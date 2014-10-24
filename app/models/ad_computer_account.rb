class ADComputerAccount < ActiveRecord::Base
  belongs_to :device

  validates :domain, length: { in: 1..252, message: 'must be less than 252 characters' },
    format: { with: /\A([[:alnum:]-]+\.)*([[:alnum:]-]+)\z/, message: 'must be valid domain eg. some.domain.tld'  }
  validates :machine_account, length: { in: 1..15, message: 'must be less than 15 characters' }
  validates :ou, format: { with: /\A(OU=[^ #][[:alnum:]\- ]+[^ ],)+(DC=[[:alnum:]\-]+,)+DC=[[:alnum:]\-]+\z/, message: 'must be BaseDN format eg. OU=Team,OU=Dept,DC=domain,DC=com'}
end
