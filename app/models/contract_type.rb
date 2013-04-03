class ContractType < ActiveRecord::Base
  attr_accessible :name, as: [:admin]
  has_many :contracts, inverse_of: :contract_type
end
