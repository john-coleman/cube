class CreateDeviceIPv4Addresses < ActiveRecord::Migration
  def change
    create_table :device_ipv4_addresses do |t|
      t.references :device
      t.references :ipv4_address

      t.timestamps
    end
    add_index :device_ipv4_addresses, [:device_id, :ipv4_address_id], unique: true
  end
end
