class User < ActiveRecord::Base
  belongs_to :manager
  has_many :orders

  has_many :trainer_bookings, class_name: Meeting.name,
    foreign_key: :trainer_id,dependent: :destroy
  has_many :customer_bookings, class_name: Meeting.name,
    foreign_key: :customer_id, dependent: :destroy

  has_many :user_meetings, dependent: :destroy
  has_many :meetings, through: :user_meetings

  enum role: [:trainer, :customer]

  validates :full_name, :tel_number, :role, :birthday, presence: true
  validates :meeting_money, presence: true, if: :trainer?
  validates :registry_date, :expiry_date, presence: true, if: :customer?
  mount_base64_uploader :avatar, AvatarUploader
  before_save :format_date
  # before_save :set_avatar

  def has_over_lap? new_start, new_end
    result = false
    if trainer?
      trainer_bookings.each do |meeting|
        if(new_start.to_datetime.strftime('%s') >= meeting.from_date.strftime('%s') &&
            new_start.to_datetime.strftime('%s') <= meeting.to_date.strftime('%s')) ||
            (new_end.to_datetime.strftime('%s') >= meeting.from_date.strftime('%s') &&
            new_end.to_datetime.strftime('%s') <= meeting.to_date.strftime('%s'))
              result = true
        end
      end
    else
      customer_bookings.each do |meeting|
        if(new_start.to_datetime.strftime('%s') >= meeting.from_date.strftime('%s') &&
            new_start.to_datetime.strftime('%s') <= meeting.to_date.strftime('%s')) ||
            (new_end.to_datetime.strftime('%s') >= meeting.from_date.strftime('%s') &&
            new_end.to_datetime.strftime('%s') <= meeting.to_date.strftime('%s'))
              result = true
        end
      end
    end
    result
  end


  private
  def format_date
    self.birthday = (DateTime.parse self.birthday).strftime "%d/%m/%Y"
    if self.customer?
      self.registry_date = (DateTime.parse self.registry_date).strftime "%d/%m/%Y"
      self.expiry_date = (DateTime.parse self.expiry_date).strftime "%d/%m/%Y"
    end
  end

end
