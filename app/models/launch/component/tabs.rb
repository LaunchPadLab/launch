class Launch::Component::Tabs < Launch::Component

  def nested_attributes
    [
      { component: :tab, type: :has_many }
    ]
  end

  def html
    content_tag tag, class: css_class do
      nested_content
    end
  end

  def css_classes
    ["tabs--menu"]
  end

  def default_tab
    :ul
  end

end