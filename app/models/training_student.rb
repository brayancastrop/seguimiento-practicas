class TrainingStudent < ActiveRecord::Base
  belongs_to :training, inverse_of: :training_students
  belongs_to :student, inverse_of: :training_students
  has_one :contract, inverse_of: :training_student

  attr_accessible :training_id, :student_id, :contract_id, as: [:admin]

  validates :training, :student, presence: true

  rails_admin do
    edit do
      exclude_fields :contract
    end
  end
  
  def name 
    [training.name, student.name].join(" - ")
  end
  
end
