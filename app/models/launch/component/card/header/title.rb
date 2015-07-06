class Launch::Component::Card::Header::Title < Launch::Component

  def html
    return "" unless content.present?
    content_tag tag, content, class: css_class
  end

  def default_tag
    :h2
  end

  def css_classes
    ["card--title"]
  end

end