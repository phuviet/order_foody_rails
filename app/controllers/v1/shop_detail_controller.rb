class V1::ShopDetailController < V1::BaseController
  def index
    render json: ShopDetailOperations::Index.new(params).call,
           each_serializer: ShopDetail::IndexSerializer
  end
end
