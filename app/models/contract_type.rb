class ContractType < ActiveRecord::Base
  attr_accessible :name, as: [:admin]
  has_many :contracts, inverse_of: :contract_type

  validates :name, presence: :true

  rails_admin do
    edit do
      exclude_fields :contracts
    end
  end
end
