ActiveModel::Serializer.config.default_includes = '**' # (default '*')
# ActiveModelSerializers.config.adapter = :json
api_mime_types = %w[
  application/vnd.api+json
  text/x-json
  application/json
]
Mime::Type.register 'application/vnd.api+json', :json, api_mime_types
