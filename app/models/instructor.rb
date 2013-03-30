class Instructor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :identification, as: [:default, :admin]

  has_many :trainings
  has_many :training_students, through: :trainings
  has_many :contracts, through: :training_students
  has_many :meetings, through: :contracts
  has_many :observations, through: :meetings
  validates :first_name, :last_name, presence: true
  validates :identification, presence: true, uniqueness: true

  rails_admin do
    edit do
      exclude_fields :trainings, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    end
  end

  def name
    [first_name, last_name].join(" ")
  end

end
