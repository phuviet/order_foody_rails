class ProductOperations::SellersOperations::Index < ApplicationOperation
  def call
    Product.top_seller.common_order
  end
end
