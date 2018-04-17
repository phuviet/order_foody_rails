class Orders::AttributesSerializer < ApplicationSerializer
  attributes :id, :receiver, :address, :phone, :status

  belongs_to :user, serializer: Users::MetaSerializer

  has_many :order_items, serializer: OrderItems::IndexSerializer
end
