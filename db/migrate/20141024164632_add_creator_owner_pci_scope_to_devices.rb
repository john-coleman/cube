class AddCreatorOwnerPciScopeToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :creator, :string
    add_column :devices, :owner, :string
    add_column :devices, :pci_scope, :string
  end
end
