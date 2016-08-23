class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :manager
  belongs_to :user

  accepts_nested_attributes_for :order_items, allow_destroy: true

  before_save :calculate_price

  class << self
    def filter_by_date filter_type, params_date
      date = Date.parse params_date rescue nil
      unless date.nil?
        case filter_type
        when "day"
          start_date = date.at_beginning_of_day
          end_date = date.at_end_of_day
        when "month"
          start_date = date.at_beginning_of_month
          end_date = date.at_end_of_month
        when "year"
          start_date = date.at_beginning_of_year
          end_date = date.at_end_of_year
        end
        self.where "created_at >= ? AND created_at <= ?", start_date, end_date
      end
    end
  end

  private
  def calculate_price
    self.total_price = 0
    self.order_items.each do |order_item|
      self.total_price += order_item.item.price * order_item.quantity
    end
  end
end
