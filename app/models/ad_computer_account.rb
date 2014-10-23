class ADComputerAccount < ActiveRecord::Base
  belongs_to :device

  validates :domain, length: { maximum: 252, message: 'AD Domain must be less than 252 characters' }
  validates :machine_account, length: { maximum: 15, message: 'AD Machine Account must be less than 15 characters' }
  validates :ou, format: { with: /\AOU=[^ #][[:alnum:]\- ]+[^ ],(OU=[^ #][[:alnum:]\- ]+[^ ],)?(DC=[[:alnum:]\-]+)?,DC=[[:alpha:]]+\z/ }
end
