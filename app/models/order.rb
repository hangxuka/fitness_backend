class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :manager
  belongs_to :user

  accepts_nested_attributes_for :order_items, allow_destroy: true
  validates :created_date, presence: true

  before_save :calculate_price

  private
  def calculate_price
    self.order_items.each do |order_item|
      self.total_price += order_item.item.price * order_item.quantity
    end
  end
end
