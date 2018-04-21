class Profiles::IndexSerializer < ApplicationSerializer
  attributes :user, :orders

  def user
    Users::ShowSerializer.new(object)
  end

  def orders
    ActiveModelSerializers::SerializableResource.new(
      object.orders, each_serializer: Orders::MetaSerializer
    )
  end
end
