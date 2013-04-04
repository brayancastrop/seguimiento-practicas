class AddCodeToProgram < ActiveRecord::Migration
  def change
    add_column :careers, :code, :string
  end
end
