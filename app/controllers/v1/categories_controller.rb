class V1::CategoriesController < V1::BaseController
  def index
    render json: CategoryOperations::Index.new(params, actor).call,
           each_serializer: Categories::IndexSerializer
  end
end
