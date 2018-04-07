class Users::MetaSerializer < ApplicationSerializer
  include AvatarDecorator

  attributes :id, :avatar, :full_name

  def full_name
    object.format_fullname
  end
end
