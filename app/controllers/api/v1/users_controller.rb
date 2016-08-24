class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:index, :new, :show]
  before_action :authenticate_with_token!
  before_action :find_user, only: [:update, :destroy, :show]

  def index
    users = if %w(trainer customer).include? params[:role]
      current_user.users.send params[:role]
    else
      current_user.users
    end
    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = current_user.users.build user_params
    if user.save
      render json: user, serializer: UserSerializer,
        messages: I18n.t("api.#{user.role}.create_success")
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def update
    if @user.update_attributes user_params
      render json: @user, serializer: UserSerializer,
        messages: t("api.#{@user.role}.update_success"), status: 200
    else
      render json: {messages: t("api.#{@user.role}.update_fail")}
    end
  end

  def destroy
    unless @user.present?
      render json: {messages: t("api.user_not_found")}
    else
      if @user.destroy
        render json: {messages: t("api.delete_user_success")}, status: 200
      else
        render json: {messages: t("api.delete_user_fail")}
      end
    end
  end

  private
  def user_params
    params.require(:user).permit :full_name, :birthday, :tel_number, :address, :salary,
      :meeting_money, :registry_date, :expiry_date, :avatar, :role
  end

  def find_user
    @user = User.find_by id: params[:id]
  end
end
