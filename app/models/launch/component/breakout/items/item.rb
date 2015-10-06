class Launch::Component::Breakout::Items::Item < Launch::Component

  def html
    return "" unless content.present?
    content_tag :li, class: "breakout--item" do
      content_tag :div, class: "breakout--content" do
        nested_content
      end
    end
  end

end