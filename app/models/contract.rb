class Contract < ActiveRecord::Base
  belongs_to :company, inverse_of: :contracts
  belongs_to :training_student, inverse_of: :contract
  has_many :meetings
  attr_accessible :contact_phone, :contact_name, :kind, :status, as: [:default, :admin]
  attr_accessible :training_student_id, :company_id, as: [:admin]

  validates :contact_name, :contact_phone, :kind, :status, presence: true
  validates :training_student, :company, presence: true
  validates :training_student_id, uniqueness: true

  rails_admin do
    edit do
      exclude_fields :meetings
    end
  end

  def name
    [training_student.name, company.name].join(" - ")
  end
end
