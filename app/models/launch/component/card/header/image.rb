class Launch::Component::Card::Header::Image < Launch::Component

  def html
    return "" unless content.present?
    h.image_tag content
  end

end