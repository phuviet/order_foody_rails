class V1::Products::NewestController < V1::BaseController
  def index
    render json: ProductOperations::NewestOperations::Index.new(params).call,
           each_serializer: ::Products::IndexSerializer
  end
end
