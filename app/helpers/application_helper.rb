module ApplicationHelper
  def full_title page_title
    base_title = I18n.t("pages.company_name")
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def show_index index
    current_page = params[:page].nil? ? 0 : params[:page].to_i - 1
    current_page * Settings.per_page.num_row_per_page + index + 1
  end

end
