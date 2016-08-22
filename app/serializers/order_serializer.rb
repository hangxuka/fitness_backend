class OrderSerializer < ActiveModel::Serializer
  attributes :user_id, :created_date, :total_price
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
