class AddIdentificationToInstructors < ActiveRecord::Migration
  def change
    add_column :instructors, :identification, :string
  end
end
