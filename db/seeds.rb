# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Administrators
#

["brayancastrop@gmail.com"].each do |email|
  Admin.create email: email, password: "password"
end

["Contrato de aprendizaje", "Contrato Laboral", "Pasantias", "Contratado", "Otros"].each do |contract_type_name|
  ContractType.create({:name => contract_type_name}, as: :admin)
end

["Aplazado", "Cancelado", "Permiso", "Condicionado"].each do |student_status_name|
  StudentStatus.create({name: student_status_name}, as: :admin)
end
