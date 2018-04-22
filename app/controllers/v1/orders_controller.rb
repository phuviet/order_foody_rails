class V1::OrdersController < V1::BaseController
  before_action -> { authentication! }

  def create
    render json: OrderOperations::Create.new(params, actor).call,
           serializer: ::Orders::CreateSerializer
  end

  def index
    render json: OrderOperations::Index.new(params, actor).call,
           each_serializer: ::Orders::IndexSerializer
  end

  def show
    render json: OrderOperations::Show.new(params, actor).call,
           serializer: ::Orders::ShowSerializer
  end
end
