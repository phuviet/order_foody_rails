class Users::ShowSerializer < ApplicationSerializer
  include AvatarDecorator

  attributes :id, :email, :first_name, :last_name, :middle_name, :phone, :address, :gender,
             :birthday, :avatar
end
