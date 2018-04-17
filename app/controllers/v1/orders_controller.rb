class V1::OrdersController < V1::BaseController
  before_action -> { authentication! }

  def create
    render json: OrderOperations::Create.new(params, actor).call,
           serializer: ::Orders::CreateSerializer
  end
end
