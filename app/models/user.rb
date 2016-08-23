class User < ActiveRecord::Base
  belongs_to :manager
  has_many :orders
  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  enum role: {trainer: 0, customer: 1}

  validates :full_name, :tel_number, :role, presence: true
  validates :meeting_money, presence: true, if: :trainer?
  validates :registry_date, :expiry_date, presence: true, if: :customer?
end
