class OrdersController < ApplicationController
  layout "user/user_layout"
  before_action :correct_user, only: [:index, :show]
  before_action :load_order, only: [:show, :edit]

  def index
    @orders = current_user.orders.paginate per_page: Settings.per_page.order,
      page: params[:page]
  end

  def show; end

  def destroy; end

  private

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
