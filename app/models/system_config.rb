class SystemConfig < ApplicationRecord
  TOP_NEWS    = 10
  TOP_SELLERS = 10

  def value
    original_value = super
    return original_value if original_value.blank?
    send data_type.to_sym, original_value
  end

  def data_type
    super || 'string'
  end

  class << self
    def top_newest
      SystemConfig.find_by!(name: 'top_newest')
    end

    def top_sellers
      SystemConfig.find_by!(name: 'top_sellers')
    end

    def expire_token
      SystemConfig.find_by!(name: 'expire_token')
    end
  end

  private

    def boolean(value)
      value.present? && (!value.to_i.zero? || value.casecmp('true').zero?)
    end

    def integer(value)
      value.to_i
    end

    def array(value)
      value.split(',')
    end

    def date(value)
      value.to_date
    end

    def string(value)
      value.to_s
    end
end
