class V1::AuthsController < V1::BaseController
  def create
    render json: AuthOperations::Create.new(params).call,
           serializer: Auths::AccessTokenSerializer
  end
end
