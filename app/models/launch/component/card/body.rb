class Launch::Component::Card::Body < Launch::Component

  def nested_components
    [:footer]
  end

  def html
    content_tag :div, class: css_class do
      nested_content
    end
  end

  private

    def css_classes
      ["card--body"]
    end


end