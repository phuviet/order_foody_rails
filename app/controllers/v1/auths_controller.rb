class V1::AuthsController < V1::BaseController
  def create
    render json: AuthOperations::Create.new(params).call,
           serializer: Auths::AccessTokenSerializer
  end

  def destroy
    authentication!
    render json: AuthOperations::Destroy.new(params, actor).call,
           serializer: Auths::DestroySerializer, root: :meta
  end
end
