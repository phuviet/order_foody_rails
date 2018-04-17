class Votes::MetaSerializer < ApplicationSerializer
  attributes :id, :star, :description, :created_at

  has_one :user, serializer: Users::MetaSerializer
end
