class Orders::IndexSerializer < ApplicationSerializer
  attributes :id, :receiver, :address, :phone, :status
end
