class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
