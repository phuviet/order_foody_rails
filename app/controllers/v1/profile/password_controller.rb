class V1::Profile::PasswordController < V1::BaseController
  before_action -> { authentication! }

  def update
    render json: ProfileOperations::PasswordOperations::Update.new(params, actor).call,
           serializer: ::Profiles::Passwords::UpdateSerializer
  end
end
