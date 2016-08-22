class MeetingsSerializer < ActiveModel::Serializer
  attributes :from_date, :to_date, :manager_id
  attribute :messages, if: -> {@instance_options[:messages].present?}

  def messages
    @instance_options[:messages]
  end
end
