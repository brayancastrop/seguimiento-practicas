class Company < ActiveRecord::Base
  has_many :contracts
  attr_accessible :name, as: [:admin]

  validates :name, presence: true, uniqueness: true

  rails_admin do
    edit do
      exclude_fields :contracts
    end
  end
end
