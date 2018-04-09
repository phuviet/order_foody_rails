class V1::ProductsController < V1::BaseController
  def index
    products = ProductOperations::Index.new(params).call
    render json: products, meta: MetaSerializer.new(products), adapter: :json,
           each_serializer: Products::IndexSerializer
  end

  def show
    render json: ProductOperations::Show.new(params).call,
           serializer: ::Products::ShowSerializer
  end
end
