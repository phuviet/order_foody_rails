module MailerHelper
  include ApplicationHelper

  def short_name(user)
    name = user.first_name
    name.strip.to_ascii
  rescue
    nil
  end

  def wrap_each_word(strings, &block)
    results = []
    Array(strings).each do |string|
      results << string.delete(' ').split(',').map(&block) if string.present?
    end
    results.flatten
  rescue
    nil
  end
end
