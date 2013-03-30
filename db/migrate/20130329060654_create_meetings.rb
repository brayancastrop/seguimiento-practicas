class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :scheduled_at
      t.boolean :accomplished
      t.references :contract

      t.timestamps
    end
    add_index :meetings, :contract_id
  end
end
