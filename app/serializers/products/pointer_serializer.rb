class Products::PointerSerializer < ApplicationSerializer
  attributes :products_new, :products_seller

  def products_new
    ActiveModelSerializers::SerializableResource.new(
      object[:products_new], each_serializer: ::Products::IndexSerializer
    )
  end

  def products_seller
    ActiveModelSerializers::SerializableResource.new(
      object[:products_seller], each_serializer: ::Products::IndexSerializer
    )
  end
end
