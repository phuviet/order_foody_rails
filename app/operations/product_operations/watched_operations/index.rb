class ProductOperations::WatchedOperations::Index < ApplicationOperation
  def call
    product_ids = ProductWatched.where(user_id: actor.id).pluck(:product_id)
    Product.where(id: product_ids).common_order
  end
end
