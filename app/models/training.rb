class Training < ActiveRecord::Base
  belongs_to :instructor, inverse_of: :trainings
  belongs_to :career, inverse_of: :trainings
  has_many :training_students, dependent: :destroy, inverse_of: :training
  has_many :students, through: :training_student
  has_many :students, through: :training_students
  
  
  accepts_nested_attributes_for :training_students, :allow_destroy => true
  attr_accessible :training_students_attributes, :career_id, :instructor_id, as: [:admin]
  attr_accessible :semester, :year, as: [:default, :admin]

  validates :semester, :year, presence: true
  validates :instructor, :career, presence: true

  rails_admin do
    edit do
      exclude_fields :training_students
    end
  end

  paginates_per 10

  def name
    [career.try(:name), year, semester].join(" ")
  end

end
