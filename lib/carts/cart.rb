class Cart
  attr_accessor :items

  def initialize items = []
    @items = items
  end

  def update_item product_id, qty
    item = @items.find{|item| item.product_id == product_id}
    if item.present?
      item.increment qty.to_i
    else
      @items << Item.new(product_id, Settings.default.quantity)
    end
  end

  def total_order
    total = 0
    @items.each do |item|
      total +=item.total_price
    end
    total
  end

  class << self
    def build_from_hash hash
      items = if hash
        hash["items"].map do |item|
          Item.new item["product_id"], item["qty"]
        end
      else
        Array.new
      end
      new items
    end
  end
end
