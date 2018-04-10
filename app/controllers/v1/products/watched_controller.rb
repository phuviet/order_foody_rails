class V1::Products::WatchedController < V1::BaseController
  before_action -> { authentication! }

  def index
    render json: ProductOperations::WatchedOperations::Index.new(params, actor).call,
           each_serializer: ::Products::IndexSerializer
  end
end
