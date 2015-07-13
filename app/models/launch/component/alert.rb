class Launch::Component::Alert < Launch::Component
  include ApplicationHelper
  include ActionView::Context

  attr_reader :warning_message, :success_message, :info_message, :type

  def after_init
    @warning_message = args[:warning_message]
    @success_message = args[:success_message]
    @info_message = args[:info_message]
    @type = @warning_message.present? ? "warning" : @success_message.present? ? "success" : "info"
  end

  def html
    return "" unless has_message?
    alert_html
  end

  private

    def alert_class
      "alert alert--#{type}"
    end

    def alert_html
      content_tag :div, class: alert_class do
        message_html.concat(dismiss_html)
      end
    end

    def message_class
      "alert--content"
    end

    def message_html
      content_tag :p, class: message_class do
        send("#{type}_message")
      end
    end

    def dismiss_html
      link_to '#', class: "alert--trigger" do
        h.embedded_svg 'icons/alert-icon.svg', class: 'alert--close-icon'
      end
    end

    def has_message?
      [warning_message.present?, success_message.present?, info_message.present?].include?(true)
    end

end