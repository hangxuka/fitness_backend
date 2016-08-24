class Api::V1::ManagersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update
  before_action :authenticate_with_token!

  def update
    if current_user.update_attributes manager_params
      render json: current_user, serializer: ManagerSerializer,
        messages: t("api.manager.update_success"), status: 200
    else
      render json: {messages: t("api.manager.update_fail")}
    end
  end

  private
  def manager_params
    params[:user][:avatar] = upload_image(params[:user][:avatar])
    params.require(:manager).permit :full_name, :user_name, :birthday,
      :address, :tel_number, :avatar
  end
  def upload_image image
    image = "data:image/png;base64," << image.gsub(/\r\n/, "")
  end
end
