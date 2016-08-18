class Transaction < ActiveRecord::Base
  has_many :transaction_items
  has_many :items, through: :transaction_items
  belongs_to :manager
  belongs_to :user
end
