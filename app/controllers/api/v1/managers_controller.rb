class Api::V1::ManagersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update
  before_action :authenticate_with_token!

  def update
    if current_user.update_attributes manager_params
      render json: {manager: ManagerSerializer.new(current_user).as_json}, status: :ok
    else
      render json: {errors: t("api.manager.update_fail")}
    end
  end

  private
  def manager_params
    params[:manager][:avatar] = set_param_image_base_64(params[:manager][:avatar])
    params.require(:manager).permit :full_name, :password,
      :birthday, :address, :tel_number, :avatar
  end
end
