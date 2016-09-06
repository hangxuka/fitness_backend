module ApplicationHelper
  def load_array_of_meetings meetings
    meetings.map{|meeting| MeetingSerializer.new(meeting).as_json}
  end

  def set_param_image_base_64 image_64
    image_64 = "data:image/png;base64," << image_64.gsub(/\r\n/, "") if image_64
  end
end
