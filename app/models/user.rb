class User < ActiveRecord::Base
  belongs_to :manager
  has_many :orders

  has_many :trainer_bookings, class_name: Meeting.name,
    foreign_key: :trainer_id,dependent: :destroy
  has_many :customer_bookings, class_name: Meeting.name,
    foreign_key: :customer_id, dependent: :destroy

  enum role: [:trainer, :customer]

  validates :full_name, :tel_number, :role, :birthday, presence: true
  validates :meeting_money, presence: true, if: :trainer?
  validates :registry_date, :expiry_date, presence: true, if: :customer?
  mount_base64_uploader :avatar, AvatarUploader

  before_save :format_date

  def has_over_lap? new_start, new_end, current_meeting_id
    result = false
    current_meeting_id = -1 unless current_meeting_id
    if trainer?
      trainer_bookings.each do |meeting|
        if over_lap?(new_start.to_datetime.strftime('%s').to_i,
          new_end.to_datetime.strftime('%s').to_i,
          meeting.from_date.strftime('%s').to_i,
          meeting.to_date.strftime('%s').to_i) && (meeting.id != current_meeting_id)
            result = true
        end
      end
    else
      customer_bookings.each do |meeting|
        if over_lap?(new_start.to_datetime.strftime('%s').to_i,
          new_end.to_datetime.strftime('%s').to_i,
          meeting.from_date.strftime('%s').to_i,
          meeting.to_date.strftime('%s').to_i) && (meeting.id != current_meeting_id)
            result = true
        end
      end
    end
    result
  end

  def over_lap? new_start, new_end, current_start, current_end
    ([new_end, current_end].max - [new_start, current_start].min) <=
      (new_end - new_start + current_end - current_start)
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
