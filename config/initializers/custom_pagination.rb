require 'will_paginate/view_helpers/link_renderer'
require 'will_paginate/view_helpers/action_view'

class MyCustomLinkRenderer < WillPaginate::ActionView::LinkRenderer
  def html_container(html)
    tag(:nav, tag(:ul, html, class: "pagination text-center"))
  end

  def previous_or_next_page(page, text, classname)
    if page
      tag(:li, link(text, page, class: "pagination-link"))
    else
      if text == "← Previous"
        tag(:li, text , class: "pagination-previous disabled")
      else
        tag(:li, text, class: "pagination-next disabled")
      end
    end
  end

  def page_number(page)
    unless page == current_page
      tag(:li, link(page, page, class: "pagination-link"))
    else
      tag(:li, tag(:a, page, class: "pagination-link current"))
    end
  end

  def gap
    tag(:li, tag(:span, '&hellip;', class: "ellipsis"))
    end
end
