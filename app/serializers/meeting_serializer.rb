class MeetingSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date, :manager_id
  attribute :messages, if: -> {@instance_options[:messages].present?}
  has_many :user_meetings, include_nested_associations: true

  def messages
    @instance_options[:messages]
  end
end
