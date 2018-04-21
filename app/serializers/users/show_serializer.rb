class Users::ShowSerializer < ApplicationSerializer
  include AvatarDecorator

  attributes :email, :first_name, :last_name, :middle_name, :phone, :address, :gender, :birthday
end
