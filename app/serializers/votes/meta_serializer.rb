class Votes::MetaSerializer < ApplicationSerializer
  attributes :id, :star

  has_one :user, serializer: Users::MetaSerializer
end
