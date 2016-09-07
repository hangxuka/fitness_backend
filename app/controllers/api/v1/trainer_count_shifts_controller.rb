class Api::V1::TrainerCountShiftsController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:show]
  before_action :authenticate_with_token!
  before_action :find_user, only: [:show]

  def show
    count_hash = Meeting.count_shifts(@user.id)
    if @user.trainer?
      render json: {count_shifts: count_hash[:count_shifts],
        count_unshifts: count_hash[:count_unshifts],
        total: count_hash[:total] }, status: :ok
    else
      render json: {errors: user.errors}, status: 422
    end
  end
  private
  def find_user
    @user = User.find_by id: params[:id]
  end
end
