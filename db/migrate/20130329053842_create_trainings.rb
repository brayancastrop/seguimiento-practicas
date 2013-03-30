class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :year
      t.string :semester
      t.references :instructor
      t.references :career

      t.timestamps
    end
    add_index :trainings, :instructor_id
    add_index :trainings, :career_id
  end
end
