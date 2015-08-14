class Launch::Component::Topbar < Launch::Component

  def html
    content_tag :header, class: css_class do
      container
    end
  end

  def container
    content_tag :nav, class: "topbar--header-container" do
      content.html_safe
    end
  end

  def tag
    :header
  end

  def css_classes
    ["topbar"]
  end

end