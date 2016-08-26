class Api::V1::RegistrationsController < Devise::RegistrationsController

  skip_before_action :verify_authenticity_token, only: :create

  def create
    @manager = Manager.new manager_params

    respond_to do |format|
      if @manager.save
        format.json do
          render json: {
            manager: @manager,
            success_message: t("api.registry_success")
          }, status: :created
        end
      else
        format.json do
          render json: {
            error: @manager.errors,
            fail_message: t("api.registry_fail")
          }, status: :un_created
        end
      end
    end
  end

  private
  def manager_params
    params.permit :full_name, :user_name, :email, :password,
      :birthday, :address, :tel_number, :avatar
  end
end
