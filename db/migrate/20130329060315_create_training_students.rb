class CreateTrainingStudents < ActiveRecord::Migration
  def change
    create_table :training_students do |t|
      t.references :training
      t.references :student

      t.timestamps
    end
    add_index :training_students, :training_id
    add_index :training_students, :student_id
  end
end
