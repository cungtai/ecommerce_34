module OrderDetailsHelper
  def show_order_detail_status order_detail
    st = t "order_details.not_found"
    st = t "order_details.not_ready" if order_detail.not_ready?
    st = t "order_details.ready" if order_detail.ready?
    st
  end
  def set_order_detail_style order_detail
    style_class = "danger"
    style_class = "warning" if order_detail.not_ready?
    style_class = "success" if order_detail.ready?
    style_class
  end
end
