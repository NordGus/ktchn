module ApplicationHelper
  def nav_link_styles(namespace)
    return 'nav-link is-active' if params[:controller].include?(namespace.to_s)

    'nav-link'
  end
end
