class ExistenceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    model = options[:with] || attribute.to_s.titleize.delete(' ')
    model = model == User.name ? User.all_users : model.constantize
    return record.errors[attribute] << I18n.t('models.can_not_blank') if value.blank?
    if model.find_by(id: value).blank?
      record.errors[attribute] << I18n.t('models.does_not_exists', subject: '')
    end
  end
end
