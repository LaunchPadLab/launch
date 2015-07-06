class Launch::ParseNested

  attr_reader :components, :component_info, :class_name, :args, :component_class

  def initialize(component_info, class_name, args)
    @component_info = component_info
    @class_name = class_name
    @args = args
    @component_class = send("find_class_from_#{component.class.name.downcase}")
    value = args.is_a?(Hash) ? component.new(args[component_key]) : nil
    generate_components
  end

  def generate_components

  end

  def find_class_from_hash
    key = component_info[:component]
    class_by_key(key)
  end

  def find_class_from_symbol
    class_by_key(component_info)
  end

  def class_by_key(key)
    key_class = key.to_s.classify
    "#{class_name}::#{key_class}".constantize
  end

end