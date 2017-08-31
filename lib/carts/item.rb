class Item
  attr_accessor :product_id, :qty

  def initialize product_id, qty
    @product_id = product_id
    @qty = qty
  end

  def unit_price
    product = Product.find_by id: @product_id
    product.current_price
  end

  def total_price
    unit_price * qty
  end

  def increment qty
    @qty += qty
  end
end
