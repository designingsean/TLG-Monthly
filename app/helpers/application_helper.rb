module ApplicationHelper
  def active_page(view)
    if params[:controller] == view
      return 'class=active'
    end
  end
end
