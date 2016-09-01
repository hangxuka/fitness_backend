class Meeting < ActiveRecord::Base
  scope :order_by_from_date, -> {order from_date: :asc}

  belongs_to :customer, class_name: User.name
  belongs_to :trainer, class_name: User.name
  belongs_to :manager

  validates :customer, presence: true
  validates :trainer, presence: true
  validates :from_date, :to_date, :manager_id, presence: true

  class << self
    def filter_by_date params_date
      date = Date.parse params_date rescue nil
      unless date.nil?
        start_date = date.at_beginning_of_day
        end_date = date.at_end_of_day
        self.where "from_date >= ? AND from_date <= ?", start_date, end_date
      end
    end
  end
end
