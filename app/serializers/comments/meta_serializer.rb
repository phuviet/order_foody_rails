class Comments::MetaSerializer < ApplicationSerializer
  attributes :id, :context, :created_at

  has_one :user, serializer: Users::MetaSerializer
end
