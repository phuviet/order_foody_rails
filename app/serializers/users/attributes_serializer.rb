class Users::AttributesSerializer < ApplicationSerializer
  include AvatarDecorator

  attributes :id, :email, :phone, :address, :gender, :birthday, :avatar, :full_name

  def full_name
    object.format_fullname
  end

  def birthday
    format_date_object_to_string(object.birthday)
  end
end
