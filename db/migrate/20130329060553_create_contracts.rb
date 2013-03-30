class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contact_name
      t.string :contact_phone
      t.string :status
      t.string :kind
      t.references :training_student
      t.references :company

      t.timestamps
    end
    add_index :contracts, :company_id
    add_index :contracts, :training_student_id    
  end
end
