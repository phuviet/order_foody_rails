class ProductOperations::Index < ApplicationOperation
  def call
    Product.all.ransack(params).result.common_order.paginate(paginate_params)
  end
end
