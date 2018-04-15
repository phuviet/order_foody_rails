class Votes::AttributesSerializer < ApplicationSerializer
  attributes :id, :star, :description

  has_one :product, serializer: Products::MetaSerializer
  has_one :user, serializer: Users::MetaSerializer
end
