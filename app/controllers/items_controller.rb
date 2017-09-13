class ItemsController < ApplicationController
  layout "user/user_layout"
  after_action :update_cart, only: [:create, :update, :destroy]
  before_action :load_item, only: [:create, :update, :destroy]

  def show
    render json: @cart.items
  end

  def create
    @cart.update_item params[:product_id], params[:qty]
  end

  def update
    if @item.present?
      @item.qty = params[:qty].to_i
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
  end

  def destroy
    @cart.items.delete_if {|item| item.product_id == params[:product_id]}
    flash[:success] = t ".success"
  end

  private

  def load_item
    @item = @cart.items.find {|item| item.product_id == params[:product_id]}
  end

end
