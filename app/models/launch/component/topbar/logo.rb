class Launch::Component::Topbar::Logo < Launch::Component

  def html
    link_to path do
      content_tag :li, class: css_class do
        content.html_safe
      end
    end
  end

  def css_classes
    ["logo"]
  end

  def required_attributes
    [:path]
  end

end