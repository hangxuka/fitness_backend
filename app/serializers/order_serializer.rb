class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :created_at, :total_price
  attribute :messages, if: -> {@instance_options[:messages].present?}
  has_many :order_items, include_nested_associations: true

  def messages
    @instance_options[:messages]
  end
end
