module ApplicationHelper
  def navbar_link_to(caption, url)
    content_tag(:li, nil, class: ('active' if current_page?(url))) do
      link_to(caption, url)
    end
  end

  def flash_class(level)
    case level
    when :notice  then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error   then 'alert alert-error'
    when :alert   then 'alert alert-error'
    end
  end
end
