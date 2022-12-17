module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then "alert alert-info"
      when "success" then "alert alert-success"
      when "error" then "alert alert-error"
      when "alert" then "alert alert-error"
    end
  end

  def formatted_date d, format=""
    return "" if d.blank?

    if format.blank?
      d.strftime("%d/%m/%Y")

    elsif format == 'format_2'
      d.strftime("%d %b %Y")

    elsif format == 'datetime'
      d.strftime("%d %b %Y - %I:%M %P")

    else
      d.strftime(format)
    end
  end
end
