class AddStatusToTrainingStudent < ActiveRecord::Migration
  def change
    add_column :training_students, :student_status_id, :integer
  end
end
