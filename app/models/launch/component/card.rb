class Launch::Component::Card < Launch::Component

  def html
    content_tag tag, class: css_class do
      nested_content
    end
  end

  def nested_components
    [:header, :body]
  end

  def css_classes
    ["card"]
  end

end