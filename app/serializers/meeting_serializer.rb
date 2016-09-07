class MeetingSerializer < ActiveModel::Serializer
  attributes :id, :from_date, :to_date, :manager_id, :trainer_id, :customer_id
  attribute :messages, if: -> {@instance_options[:messages].present?}
  def messages
    @instance_options[:messages]
  end

  belongs_to :trainer
  belongs_to :customer
end
