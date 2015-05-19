module ApplicationHelper
  def active_page(view)
    if params[:controller] == view
      return 'class=active'
    end
  end

  def relative_url
    Monthly::Application.config.action_controller.relative_url_root || ""
  end
end
