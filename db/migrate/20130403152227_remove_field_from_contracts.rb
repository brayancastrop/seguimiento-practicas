class RemoveFieldFromContracts < ActiveRecord::Migration
  def up
    remove_column :contracts, :kind
  end

  def down
    add_column :contracts, :kind, :string
  end
end
