class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :manager_id
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
