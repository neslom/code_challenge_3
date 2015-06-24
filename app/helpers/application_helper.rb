module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: "alert") do
        concat(content_tag(:button, class: "close", data: { dismiss: "alert" }) do
          concat content_tag(:span, "&times;".html_safe, "aria-hidden" => true)
          concat content_tag(:span, "Close", class: "sr-only")
        end)
        concat message
      end)
    end
    nil
  end

  def like_icon
    if Rails.env.test?
      "like me"
    else
      '<i class="fa fa-check fa-5x" alt="yes"></i>'.html_safe
    end
  end

  def dislike_icon
    if Rails.env.test?
      "dislike me"
    else
      '<i class="fa fa-times fa-5x" alt="no"></i>'.html_safe
    end
  end
end
