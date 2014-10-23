class CreateIPv4Addresses < ActiveRecord::Migration
  def change
    create_table :ipv4_addresses do |t|
      t.string :ipv4_address
      t.string :mac_address
      t.string :ptr_record

      t.timestamps
    end
  end
end
