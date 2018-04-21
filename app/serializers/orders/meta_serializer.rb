class Orders::MetaSerializer < ApplicationSerializer
  attributes :id, :receiver, :address, :phone, :status
end
