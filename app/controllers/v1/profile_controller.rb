class V1::ProfileController < V1::BaseController
  before_action -> { authentication! }

  def index
    render json: ProfileOperations::Index.new(params, actor).call,
           serializer: ::Profiles::IndexSerializer
  end
end
