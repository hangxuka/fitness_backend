class User < ActiveRecord::Base
  belongs_to :manager
  has_many :transactions
  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  enum role: {trainer: 0, customer: 1}
end
