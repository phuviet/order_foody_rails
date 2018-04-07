class Products::AttributesSerializer < ApplicationSerializer
  include AvatarDecorator

  attributes :id, :name, :avatar, :price, :star
end
