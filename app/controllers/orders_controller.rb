class OrdersController < ApplicationController
  layout "user/user_layout"
  before_action :correct_user, only: [:index, :show, :edit]
  before_action :load_order, only: [:show, :edit, :update]

  def index
    @orders = current_user.orders.where("status <> ?", Settings.default.order.created).paginate per_page: Settings.per_page.order,
      page: params[:page]
  end

  def show; end

  def edit
    if current_order.order_details.blank?
      flash[:danger] = t ".empty_carts"
      redirect_to request.referrer
    end
  end

  def update
    if @order.update_attributes order_params
      flash[:success] = t ".success"
      @order.waiting!
      redirect_to root_path
    else
      flash[:danger] = t ".failed"
    end
  end

  def destroy; end

  private

  def order_params
      params.require(:order).permit :receiver_name, :receiver_phone, :receiver_email, :payment_id
  end

  def correct_user
    redirect_to root_path unless current_user
  end

  def load_order
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] = t "orders.not_found"
      redirect_to root_url
    end
  end
end
