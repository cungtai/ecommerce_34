class CartsController < ApplicationController
  layout "user/user_layout"
  include AuthHelper
  include CartsHelper
  before_action :check_login
  before_action :load_item, only: [:update, :destroy]

  def index
  end

  def create
    if @cart.items.present?
      made_order
    else
      flash[:danger] = t ".cart_empty"
    end
  end

end
