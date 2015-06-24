class Launch::Component::Card::Body::Footer < Launch::Component

  def html
    return "" unless content.present?
    content_tag :footer, role: "contentinfo", class: css_class do
      nested_content
    end
  end

  private

    def css_classes
      ["card--footer"]
    end


end