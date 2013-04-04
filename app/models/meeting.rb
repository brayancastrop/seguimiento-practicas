class Meeting < ActiveRecord::Base
  belongs_to :contract
  has_many :observations, dependent: :destroy
  attr_accessible :scheduled_at, as: [:default, :admin]
  attr_accessible :contract_id, as: [:admin]

  rails_admin do
    edit do
      exclude_fields :observations
    end
  end 

  paginates_per 10
  
  scope :accomplished, joins(:observations).group("meetings.id").having("count(observations.id) > 0")  

  validates :contract, presence: :true
  def name
    [contract.try(:name), scheduled_at.to_s].join(" - ")
  end

  def accomplished?
    observations.count > 0
  end
end
