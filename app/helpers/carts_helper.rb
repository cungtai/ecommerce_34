module CartsHelper
  def find_product id
    @product = Product.find_by id: id
  end

  def made_order
    order = current_user.orders.build
    if order.save
      @cart.items.each do |item|
        order_detail = order.order_details.build product_id: item.product_id,
          qty: item.qty
        unless order_detail.save
          flash[:danger] = t ".false_save_order_detail"
        end
      end
      clear_cart
    else
      flash[:danger] = t ".false_made_order"
    end
  end
end
