class ProductOperations::Show < ApplicationOperation
  def call
    ActiveRecord::Base.transaction do
      @product = Product.includes_details.find(params[:id])
      if actor.present?
        product_watcher = ProductWatched.find_by(user_id: actor.id, product_id: @product.id)
        product_watcher.destroy! if product_watcher.present?
        ProductWatched.create!(user_id: actor.id, product_id: @product.id)
      end
    end
    @product
  end
end
