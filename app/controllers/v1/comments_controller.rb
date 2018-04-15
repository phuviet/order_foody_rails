class V1::CommentsController < V1::BaseController
  before_action -> { authentication! }

  def create
    render json: CommentOperations::Create.new(params, actor).call,
           each_serializer: Comments::ParentSerializer
  end
end
