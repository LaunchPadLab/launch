class Launch::Component::Tabs::Tab < Launch::Component

  def html
    content_tag tag, class: css_class do
      content
    end
  end

  def css_classes
    ["tabs--link"]
  end

  def default_tag
    :li
  end

end