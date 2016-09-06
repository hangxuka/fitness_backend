class OrderItemSerializer < ActiveModel::Serializer
  attributes :quantity, :item, :id
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
