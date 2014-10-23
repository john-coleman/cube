class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :hostname
      t.string :domain
      t.string :os

      t.timestamps
    end
  end
end
