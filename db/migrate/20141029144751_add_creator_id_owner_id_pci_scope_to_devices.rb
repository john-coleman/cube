class AddCreatorIdOwnerIdPCIScopeToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :creator_id, :integer
    add_column :devices, :owner_id, :integer
    add_column :devices, :pci_scope, :string
  end
end
