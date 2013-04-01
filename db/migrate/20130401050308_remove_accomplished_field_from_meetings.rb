class RemoveAccomplishedFieldFromMeetings < ActiveRecord::Migration
  def up
    remove_column :meetings, :accomplished
    
  end

  def down
    add_column :meetings, :accomplished, :boolean
  end
end
