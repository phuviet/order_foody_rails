class V1::Users::RegisterController < V1::BaseController
  def create
    render json: UsersOperations::RegisterOperations::Create.new(params).call
          #  serializer: Auths::AccessTokenSerializer
  end

end
