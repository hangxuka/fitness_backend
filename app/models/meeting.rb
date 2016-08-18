class Meeting < ActiveRecord::Base
  has_many :user_meetings
  has_many :users, through: :user_meetings
  belongs_to :manager
end
