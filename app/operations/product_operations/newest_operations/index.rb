class ProductOperations::NewestOperations::Index < ApplicationOperation
  def call
    Product.top_newest.common_order
  end
end
