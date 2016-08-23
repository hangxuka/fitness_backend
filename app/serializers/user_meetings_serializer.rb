class UserMeetingsSerializer < ActiveModel::Serializer
  attributes :id, :user_id
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
