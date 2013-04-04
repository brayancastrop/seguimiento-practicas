class Student < ActiveRecord::Base
  has_many :training_students, dependent: :destroy, inverse_of: :student
  has_many :trainings, through: :training_students
  belongs_to :student_status, inverse_of: :student
  attr_accessible :cellphone, :email, :first_name, :identification, :last_name, :phone, as: [:default, :admin]

  validates :email, :first_name, :last_name, :phone, presence: true
  validates :identification, presence: true, uniqueness: true

  rails_admin do
    edit do
      exclude_fields :training_students, :trainings
    end
  end

  def name
    [first_name, last_name].join(" ")
  end
    
end
