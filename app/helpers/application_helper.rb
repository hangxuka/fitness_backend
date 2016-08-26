module ApplicationHelper
  def have_over_lap? trainer, customer, meeting_params
    new_start = meeting_params[:from_date]
    new_end = meeting_params[:to_date]
    result = (trainer.has_over_lap?(new_start, new_end) ||
     customer.has_over_lap?(new_start, new_end))
  end
end
