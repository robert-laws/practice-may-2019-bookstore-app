module ApplicationHelper
  def error_messages_for(object)
    render partial: "application/error_messages", locals: { object: object }
  end

  def display_time(time_value)
    time_value.strftime("%A, %b %e, at %l:%M %p")
  end
end
