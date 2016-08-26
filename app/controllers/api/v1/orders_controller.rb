class Api::V1::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:index, :new, :show]
  before_action :authenticate_with_token!
  before_action :find_order, only: [:update, :destroy, :show]

  def index
    if type = params[:filter_type].present?
      order = current_user.orders.filter_by_date params[:filter_type],
        params[:date]
      render json: order
    else
      order = current_user.orders
      render json: order
    end
  end

  def show
    render json: @order
  end

  def create
    @order = current_user.orders.new order_params
    if @order.save
      render json: @order, serializer: OrderSerializer,
        messages: t("api.order.create_success")
    else
      render json: {messages: t("api.order.create_fail")}
    end
  end

  def update
    unless @order.present?
      render json: {messages: t("api.order.not_found")}
    else
      if @order.update_attributes order_params
        render json: @order, serializer: OrderSerializer,
          messages: t("api.order.update_success")
      else
        render json: {messages: t("api.order.update_success")}
      end
    end
  end

  def destroy
    unless @order.present?
      render json: {messages: t("api.order.not_found")}
    else
      if @order.destroy
        render json: {messages: t("api.order.delete_success")}
      else
        render json: {messages: t("api.order.delete_fail")}
      end
    end
  end

  private
  def order_params
    params.require(:order).permit :user_id, order_items_attributes: [:id,
      :item_id, :quantity, :_destroy]
  end

  def find_order
    @order = Order.find_by id: params[:id]
  end
end
