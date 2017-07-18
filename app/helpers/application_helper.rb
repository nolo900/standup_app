module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when "notice" then "alert-info"
      when "success" then "alert-success"
      when "error" then "alert-danger"
      when "alert" then "alert-warning"
    end
  end

  def flash_messages( _opts = {} )

    flash.each do |msg_type, message|
      # puts 'msg_type: ', msg_type, 'message: ', message
      next if msg_type == :form_error

      concat(content_tag(:div, message.html_safe, {
          class: "alert #{bootstrap_class_for(msg_type)} fade in"}) do
          concat content_tag(:button, 'x', class: 'close', data: {
              dismiss:'alert'
            })
          concat message.html_safe
      end)

    end

    nil

  end

end
