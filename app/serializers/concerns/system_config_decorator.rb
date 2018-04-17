module SystemConfigDecorator
  def convert_data(item)
    item.date? ? format_date_object_to_string(item.value) : item.value
  end
end
