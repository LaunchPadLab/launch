class Launch::Component::Breakout::Items::Item::Subtitle < Launch::Component

  def tag
    :h4
  end

  def css_classes
    super + ["item--title"]
  end

end