class ProductOperations::WatchedOperations::Index < ApplicationOperation
  def call
    product_ids = ProductWatched.where(user_id: actor.id).common_order.pluck(:product_id)
    Product.where(id: product_ids)
  end
end
