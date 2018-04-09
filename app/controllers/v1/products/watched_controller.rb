class V1::Products::WatchedController < V1::BaseController
  def index
    render json: ProductOperations::WatchedOperations::Index.new(params).call,
           each_serializer: ::Products::IndexSerializer
  end
end
