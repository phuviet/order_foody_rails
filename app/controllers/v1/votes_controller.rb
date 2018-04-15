class V1::VotesController < V1::BaseController
  before_action -> { authentication! }

  def create
    render json: VoteOperations::Create.new(params, actor).call,
           each_serializer: Votes::CreateSerializer
  end
end
