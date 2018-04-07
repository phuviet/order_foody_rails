class Comments::MetaSerializer < ApplicationSerializer
  attributes :id, :context

  has_one :user, serializer: Users::MetaSerializer
end
