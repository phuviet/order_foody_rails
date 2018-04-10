class V1::Products::SellersController < V1::BaseController
  def index
    render json: ProductOperations::SellersOperations::Index.new(params, actor).call,
           each_serializer: ::Products::IndexSerializer
  end
end
