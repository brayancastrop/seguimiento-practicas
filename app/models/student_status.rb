class StudentStatus < ActiveRecord::Base
  has_many :training_students, inverse_of: :student_status
  attr_accessible :name, as: [:admin]

  validates :name, presence: :true, uniqueness: :true

  rails_admin do
    edit do
      exclude_fields :training_students
    end
  end
end
