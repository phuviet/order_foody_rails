class CategoryOperations::ProductOperations::Index < ApplicationOperation
  def call
    Product.where(category_id: params[:category_id]).ransack(params).result.common_order
           .paginate(paginate_params)
  end
end
