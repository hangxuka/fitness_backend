class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :user_name, :birthday, :address, :tel_number,
    :avatar
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
