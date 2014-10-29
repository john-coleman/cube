class AddDeviceIdToADComputerAccount < ActiveRecord::Migration
  def change
    add_column :ad_computer_accounts, :device_id, :integer
  end
end
