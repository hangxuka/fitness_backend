class User < ActiveRecord::Base
  belongs_to :manager
  has_many :orders
  has_many :user_meetings, dependent: :destroy
  has_many :meetings, through: :user_meetings

  enum role: {trainer: 0, customer: 1}

  validates :full_name, :tel_number, :role, presence: true
  validates :meeting_money, presence: true, if: :trainer?
  validates :registry_date, :expiry_date, presence: true, if: :customer?
  mount_base64_uploader :avatar, AvatarUploader
  before_save :format_date
  # before_save :set_avatar
  private
  def format_date
    self.birthday = (DateTime.parse self.birthday).strftime "%d/%m/%Y"
    if self.customer?
      self.registry_date = (DateTime.parse self.registry_date).strftime "%d/%m/%Y"
      self.expiry_date = (DateTime.parse self.expiry_date).strftime "%d/%m/%Y"
    end
  end

end
