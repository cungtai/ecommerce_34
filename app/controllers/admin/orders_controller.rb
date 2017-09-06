class Admin::OrdersController < BaseAdminController
  before_action :load_order, except: [:index, :create]
  def index
    @orders = Order.by_receiver_name(params[:search]).paginate page: params[:page],
      per_page: Settings.per_page.order
  end

  def show
  end

  def edit
  end

  def update
    if @order.update_attributes order_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to request.referer
  end

  def destroy
  end

  private
  def load_order
    @order = Order.find_by id: params[:id]
    unless @order
      flash[:danger] = t "error.product_not_found"
      redirect_to root_url
    end
  end

  def order_params
    params.require(:orders).permit :receiver_name, :receiver_email,
      :receiver_phone, :status
  end
end
