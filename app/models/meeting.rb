class Meeting < ActiveRecord::Base
  scope :order_by_from_date, -> {order from_date: :asc}

  belongs_to :customer, class_name: User.name
  belongs_to :trainer, class_name: User.name
  belongs_to :manager

  validates :customer, presence: true
  validates :trainer, presence: true
  validates :from_date, :to_date, :manager_id, presence: true
  validate :validate_time

  class << self
    def filter_by_date params_date
      date = Date.parse params_date rescue nil
      unless date.nil?
        start_date = date.at_beginning_of_day
        end_date = date.at_end_of_day
        self.where "from_date >= ? AND from_date <= ?", start_date, end_date
      end
    end

    def count_shifts id
      count = 0;
      count_unshifts = 0;
      total = 0;
      user = User.find id
      meetings = Meeting.where(trainer_id: id)
      meetings.each do |meeting|
        if(meeting.from_date >= Date.today.beginning_of_month && meeting.to_date <= Date.today)
          count += 1
        elsif(meeting.from_date > Date.today && meeting.to_date < Date.today.end_of_month)
          count_unshifts += 1
        end
      end
      total = count * user.meeting_money
      {count_shifts: count,total: total,count_unshifts: count_unshifts}
    end
  end

  def validate_time
    if (trainer.has_over_lap?(from_date, to_date, id) ||
      customer.has_over_lap?(from_date, to_date, id))
        errors.add :over_lap, I18n.t("api.meeting.over_lap")
    end
    if from_date.to_datetime.strftime('%s') < Time.now.to_datetime.strftime('%s') ||
      to_date.to_datetime.strftime('%s') < Time.now.to_datetime.strftime('%s')
        errors.add :time, I18n.t("api.meeting.time_unacceptable")
    end
  end
end
