class Api::V1::MeetingsController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:index, :new, :show]
  before_action :authenticate_with_token!
  before_action :find_Meeting, only: [:update, :destroy, :show]

  def index
    if type = params[:date].present?
      @meetings = current_user.meetings.filter_by_date(params[:date])
        .order_by_from_date
      render json: @meetings
    else
      @meetings = current_user.meetings.order_by_from_date
      render json: @meetings
    end
  end

  def show
    render json: @meeting
  end

  def create
    @meeting = current_user.meetings.new meeting_params
    if @meeting.save
      render json: @meeting, serializer: MeetingsSerializer,
        messages: t("api.meeting.create_success")
    else
      render json: {messages: t("api.meeting.create_fail")}
    end
  end

  def update
    if @meeting.present?
      if @meeting.update_attributes meeting_params
        render json: @meeting, serializer: MeetingsSerializer,
          messages: t("api.meeting.update_success")
      else
        render json: {messages: t("api.meeting.update_success")}
      end
    else
      render json: {messages: t("api.meeting.not_found")}
    end
  end

  def destroy
    if @meeting.present?
      if @meeting.destroy
        render json: {messages: t("api.meeting.delete_success")}
      else
        render json: {messages: t("api.meeting.delete_fail")}
      end
    else
      render json: {messages: t("api.meeting.not_found")}
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit :from_date, :to_date, :manager_id,
      user_meetings_attributes: [:id, :user_id, :_destroy]
  end

  def find_Meeting
    @meeting = Meeting.find_by id: params[:id]
  end
end
