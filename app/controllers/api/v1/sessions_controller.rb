class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    manager = Manager.find_by email: params[:email]

    if manager && manager.valid_password?(params[:password])
      sign_in manager, store: false
      manager.generate_authentication_token!
      manager.save
      render json: {user: manager, success_message: t("api.login_success")}, status: 200
    else
      render json: {error_message: t("api.login_fail")}, status: 422
    end
  end

  def destroy
    if current_manager.present?
      current_manager.generate_authentication_token!
      current_manager.save
      sign_out current_manager
      render json: {success_message: t("api.logout_success")}
    else
      render json: {error_message: t("api.logout_fail")}
    end
  end
end
