module SuggestProductsHelper
  def show_status suggest_product
    st = t ".not_found"
    st = t ".waiting" if suggest_product.waiting?
    st = t ".finished" if suggest_product.finished?
    st
  end
  def set_class suggest_product
    style_class = "danger"
    style_class = "warning" if suggest_product.waiting?
    style_class = "success" if suggest_product.finished?
    style_class
  end

  def suggest_products_status
    list = Hash.new
    list[:waiting] = t "admin.suggest_products.edit.waiting"
    list[:finished] = t "admin.suggest_products.edit.finished"
    list.map{|key, value| [value, key]}
  end

  def all_catalogs
    Catalog.all.map{|cat| [cat.name,cat.id]}
  end
end
