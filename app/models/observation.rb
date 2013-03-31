class Observation < ActiveRecord::Base
  belongs_to :meeting
  attr_accessible :content, :meeting_id, as: [:default, :admin]

  validates :content, :meeting, presence: true

  paginates_per 10  

end
