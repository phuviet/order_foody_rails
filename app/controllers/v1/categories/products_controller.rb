class V1::Categories::ProductsController < V1::BaseController
  def index
    products = CategoryOperations::ProductOperations::Index.new(params).call
    render json: products, meta: MetaSerializer.new(products), adapter: :json,
           each_serializer: Products::IndexSerializer
  end
end
