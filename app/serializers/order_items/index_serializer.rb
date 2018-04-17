class OrderItems::IndexSerializer < ApplicationSerializer
  attributes :id, :quantity, :total_price
  belongs_to :product, serializer: Products::MetaSerializer
end
