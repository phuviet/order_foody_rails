class Votes::AttributesSerializer < ApplicationSerializer
  attributes :id, :star, :description, :created_at

  has_one :product, serializer: Products::MetaSerializer
  has_one :user, serializer: Users::MetaSerializer
end
