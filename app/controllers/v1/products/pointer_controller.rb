class V1::Products::PointerController < V1::BaseController
  before_action -> { authentication!(false) }

  def index
    render json: ProductOperations::PointerOperations::Index.new(params, actor).call,
           serializer: ::Products::PointerSerializer
  end
end
