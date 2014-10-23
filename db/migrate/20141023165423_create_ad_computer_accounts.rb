class CreateADComputerAccounts < ActiveRecord::Migration
  def change
    create_table :ad_computer_accounts do |t|
      t.string :domain
      t.string :machine_account
      t.string :ou

      t.timestamps
    end
  end
end
