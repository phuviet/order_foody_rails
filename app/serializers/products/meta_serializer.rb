class Products::MetaSerializer < ApplicationSerializer
  include AvatarDecorator

  attributes :id, :name
end
