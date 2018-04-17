module ApplicationHelper
  def format_date_string_to_object(str, datetime: false)
    return if str.blank?
    format = datetime ? '%Y-%m-%d %H:%M:%S' : '%Y-%m-%d'
    Date.strptime(str, format)
  rescue StandardError
    nil
  end

  def format_date_object_to_string(object, datetime: false)
    return if object.blank?
    format = datetime ? '%Y-%m-%d %H:%M:%S' : '%Y-%m-%d'
    object.strftime(format)
  rescue StandardError
    nil
  end

  def date?(date)
    true if date.to_date
  rescue
    false
  end
end
