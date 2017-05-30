module ApplicationHelper
  def active_if(values)
    current_page?(values) ? ' active' : ''
  end

  def current_if(values)
    current_page?(values) ? ' <span class="sr-only">(current)</span>'.html_safe : ''
  end
end
