ActiveRecord::Base.transaction do
  SystemConfig.find_or_create_by!(name: 'top_newest')
              .update!(value: SystemConfig::TOP_NEWS, data_type: 'integer')
  SystemConfig.find_or_create_by!(name: 'top_sellers')
              .update!(value: SystemConfig::TOP_SELLERS, data_type: 'integer')
  SystemConfig.find_or_create_by!(name: 'expire_token')
              .update!(value: '30', data_type: 'integer')
end
