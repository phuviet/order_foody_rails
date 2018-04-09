class ProductOperations::Show < ApplicationOperation
  def call
    ActiveRecord::Base.transaction do
      @product = Product.includes_details.find(params[:id])
      ProductWatched.find_or_create_by(user_id: actor.id, product_id: @product.id) if actor.present?
    end
    @product
  end
end
