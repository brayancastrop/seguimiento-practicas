class Career < ActiveRecord::Base
  has_many :trainings, dependent: :destroy, inverse_of: :career
  attr_accessible :name, :code, as: [:default, :admin]

  validates :name, :code, presence: true, uniqueness: true

  rails_admin do
    edit do
      exclude_fields :trainings
    end
  end

end
