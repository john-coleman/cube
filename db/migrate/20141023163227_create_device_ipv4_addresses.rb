class CreateDeviceIPv4Addresses < ActiveRecord::Migration
  def change
    create_table :device_ipv4_addresses do |t|

      t.timestamps
    end
  end
end
