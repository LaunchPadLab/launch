class Launch::Component::Alert::Banner < Launch::Component::Alert

  def alert_class
    super.concat(" alert__banner")
  end

end