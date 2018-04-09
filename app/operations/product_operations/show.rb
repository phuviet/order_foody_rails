class ProductOperations::Show < ApplicationOperation
  def call
    ActiveRecord::Base.transaction do
      @product = Product.includes_details.find(params[:id])
      ProductWatcher.find_or_create_by(user: user, product: @product) if user.present?
    end
    @product
  end
end
