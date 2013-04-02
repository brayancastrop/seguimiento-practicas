class AddMissingInfoToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :contact_address, :string
    add_column :contracts, :start_at, :date
    add_column :contracts, :end_at, :date
  end
end
