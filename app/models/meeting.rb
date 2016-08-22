class Meeting < ActiveRecord::Base
  has_many :user_meetings
  has_many :users, through: :user_meetings
  belongs_to :manager

  validates :from_date, :to_date, :manager_id, presence: true

end
