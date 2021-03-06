module Launch
  module Helper

    def launch_component(name, args = {}, &block)
      if name.is_a?(Symbol)
        class_name = name.to_s.titleize
      else
        class_name = name.split("/").map {|n| n.titleize.sub(" ", "") }.join("::")
      end
      if block_given?
        args.merge!(content: capture(&block).strip)
      end
      "Launch::Component::#{class_name}".constantize.new(args).html
    end

    alias_method :launch, :launch_component

    def embedded_svg filename, options={}
      path = Rails.application.assets.find_asset(filename).pathname
      file = File.read(path)
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css 'svg'
      if options[:class].present?
        svg['class'] = options[:class]
      end
      doc.to_html.html_safe
    end

  end
end