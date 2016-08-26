class OrderItemSerializer < ActiveModel::Serializer
  attributes :quantity, :item
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
