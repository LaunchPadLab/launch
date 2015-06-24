module Launch
  module Helper

    def launch_component(name, args)
      if name.is_a?(Symbol)
        class_name = name.to_s.classify
      else
        class_name = name.split("/").map(&:classify).join("::")
      end
      "Launch::Component::#{class_name}".constantize.new(args).html
    end

  end
end