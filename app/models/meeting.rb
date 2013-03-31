class Meeting < ActiveRecord::Base
  belongs_to :contract
  has_many :observations
  attr_accessible :accomplished, :scheduled_at, as: [:default, :admin]
  attr_accessible :contract_id, as: [:admin]

  rails_admin do
    edit do
      exclude_fields :observations
    end
  end 

  paginates_per 10
  

  def name
    [contract.name, scheduled_at.to_s].join(" - ")
  end
end
