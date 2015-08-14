class Launch::Component
  include ActionView::Helpers
  include ::ApplicationHelper
  include ActionView::Context

  attr_reader :add_class, :content, :args, :tag

  def initialize(args)
    @args = args
    parse_incoming_data
    set_optional_attributes
    set_required_attributes
    set_nested_components
    @tag ||= default_tag
    after_init
  end

  def html
    content_tag tag, class: css_class do
      nested_content
    end
  end

  private

    def h
      ActionController::Base.helpers
    end

    def parse_incoming_data
      incoming_class = args.class.name.downcase
      if %w(string nilclass hash).include?(incoming_class)
        send("parse_#{incoming_class}")
      else
        @content = args
      end
    end

    def parse_string
      @content = args
    end

    def parse_nilclass

    end

    def parse_hash
      @content = args[:content]
      @content = @content.join("") if @content.is_a?(Array)
      @add_class = args[:add_class]
      @tag = args[:tag]
    end

    def after_init
      # implemented by children
    end

    def css_class
      (css_classes << add_class).compact.join(" ")
    end

    def css_classes
      [] # implemented by children
    end

    def set_optional_attributes
      optional_attributes.each do |attr|
        value = args.is_a?(Hash) ? args[attr] : nil
        set_attr(attr, value)
      end
    end

    def set_required_attributes
      required_attributes.each do |attr|
        value = args.is_a?(Hash) ? args[attr] : nil
        raise "The :#{attr} option is required for #{component_name} component. Pass with: <%= launch_component(\'#{component_name}\', :#{attr} => option_value) %>" unless value.present?
        set_attr(attr, value)
      end
    end

    def set_attr(attr, value)
      self.class.__send__(:attr_accessor, attr)
      instance_variable_set("@#{attr.to_s}", args.is_a?(Hash) ? args[attr] : nil)
    end

    def set_nested_components
      nested_components.each do |component_key|
        key_class = component_key.to_s.classify
        component = "#{self.class.name}::#{key_class}".constantize
        self.class.__send__(:attr_accessor, component_key)
        value = args.is_a?(Hash) ? component.new(args[component_key]) : nil
        instance_variable_set("@#{component_key.to_s}", value)
      end
    end

    def nested_components
      []
    end

    def optional_attributes
      []
    end

    def required_attributes
      []
    end

    def nested_prioritized_content
      @nested_prioritized_content ||= (
        return content if content.present?
        return "" if nested_components.empty?
        nested_components.each do |component_key|
          component_html = send(component_key).try(:html)
          return component_html if component_html.present?
        end
        ""
      )
    end

    def nested_content
      @nested_content ||= (
        components_html = nested_components.collect do |component_key|
          send(component_key).try(:html)
        end

        components_html.unshift(content).compact.join.html_safe
      )
    end

    def default_tag
      # implemented by children
      :div
    end

    def component_name
      @component_name ||= self.class.name.sub('Launch::Component::', '').sub('::', '/').downcase
    end

end