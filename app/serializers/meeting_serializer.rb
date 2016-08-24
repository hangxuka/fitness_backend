class MeetingSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date, :manager_id
  attribute :messages, if: -> {@instance_options[:messages].present?}
  has_many :user_meetings
  has_many :users
  def messages
    @instance_options[:messages]
  end
end
