class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.text :content
      t.references :meeting

      t.timestamps
    end
    add_index :observations, :meeting_id
  end
end
