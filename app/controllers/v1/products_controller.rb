class V1::ProductsController < V1::BaseController
  before_action -> { authentication!(false) }

  def index
    products = ProductOperations::Index.new(params, actor).call
    render json: products, meta: MetaSerializer.new(products), adapter: :json,
           each_serializer: Products::IndexSerializer
  end

  def show
    render json: ProductOperations::Show.new(params, actor).call,
           serializer: ::Products::ShowSerializer
  end
end
