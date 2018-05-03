class V1::Users::ConfirmController < V1::BaseController
  def update
    render json: UsersOperations::ConfirmOperations::Update.new(params).call,
           serializer: Users::ShowSerializer
  end
end
