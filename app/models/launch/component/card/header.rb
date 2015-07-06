class Launch::Component::Card::Header < Launch::Component

  def optional_attributes
    [:color]
  end

  def nested_components
    [:title, :image]
  end

  def html
    return "" unless nested_prioritized_content.present?
    content_tag :header, role: "banner", class: css_class do
      nested_prioritized_content
    end
  end

  def css_classes
    ["card--header", color]
  end

end