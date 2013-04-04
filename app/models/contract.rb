class Contract < ActiveRecord::Base
  belongs_to :company, inverse_of: :contracts
  belongs_to :training_student, inverse_of: :contract
  belongs_to :contract_type, inverse_of: :contracts
  has_many :meetings, dependent: :destroy
  attr_accessible :contact_phone, :contact_name, :contact_address, :start_at, :end_at, :status, as: [:default, :admin]
  attr_accessible :training_student_id, :company_id, :contract_type_id, as: [:admin]

  validates :contact_name, :contact_phone, :contact_address, :status, presence: true
  validates :training_student, :company, presence: true
  validates :training_student_id, uniqueness: true

  rails_admin do
    edit do
      exclude_fields :meetings
    end
  end

  paginates_per 10  

  def name
    [training_student.try(:name), company.try(:name)].join(" - ")
  end
end
