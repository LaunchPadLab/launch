module Launch
  module Helper

    def launch_component(name, args)
      if name.is_a?(Symbol)
        class_name = name.to_s.titleize
      else
        class_name = name.split("/").map(&:titleize).join("::")
      end
      "Launch::Component::#{class_name}".constantize.new(args).html
    end

    def embedded_svg filename, options={}
      file = File.read(Launch::Engine.root.join('app', 'assets', 'images', filename))
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css 'svg'
      if options[:class].present?
        svg['class'] = options[:class]
      end
      doc.to_html.html_safe
    end

  end
end