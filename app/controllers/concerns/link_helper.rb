module LinkHelper
  def link(url, title)
    "<a href = '#{url}' target = '_blank' >#{title}</a>".html_safe
  end
end