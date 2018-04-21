class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def valid!
    return if valid?
    raise BadRequestError, fetch_messages
  end

  def fetch_messages
    return @messages if @messages.present?
    # get only the first error message of each attributes
    @messages = errors.messages.inject({}) do |messages, message|
      messages.merge message.first => message.second.first
    end
  end
end
