class Item < ActiveRecord::Base
  has_may :transaction_items
  has_many :transactions, through: :transaction_items
  belongs_to :manager
end
