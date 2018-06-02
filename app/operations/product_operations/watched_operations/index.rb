class ProductOperations::WatchedOperations::Index < ApplicationOperation
  def call
    product_ids = ProductWatched.where(user_id: actor.id).common_order.pluck(:product_id)
    Product.joins(:product_watcheds).where(id: product_ids).order('product_watcheds.created_at DESC')
  end
end
