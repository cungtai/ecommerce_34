class OrderDetailsController < ApplicationController
  layout "user/user_layout"
  include AuthHelper
  before_action :check_login

  def new
    if params[:product_id].present?
      @product = Product.find_by id: params[:product_id]
    end
    @order_detail = OrderDetail.new
  end

  def create
    @order = current_order
    if @order.nil?
      render html: current_order.class
    end
    @order_detail = @order.order_details.find_by product_id: order_detail_params[:product_id]
    if @order_detail.present?
      @order_detail.update_attributes qty: @order_detail.qty + order_detail_params[:qty].to_i
    else
      @order_detail = @order.order_details.build order_detail_params
      if @order_detail.save
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".failed"
      end
      if @order.save
        flash[:success] = t ".success"
        session[:order_id] = @order.id
      else
        flash[:danger] = @order.errors.full_messages
      end
    end

    redirect_to carts_path
  end

  def edit
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find_by id: params[:id]
    @order_detail.update_attributes order_detail_params
    @order_details = @order.order_details
    redirect_to request.referrer
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order_details = @order.order_details
  end

  private

  def order_detail_params
    params.require(:order_detail).permit :product_id, :qty
  end

end
