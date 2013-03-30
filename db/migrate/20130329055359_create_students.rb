class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :identification
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :cellphone

      t.timestamps
    end
  end
end
