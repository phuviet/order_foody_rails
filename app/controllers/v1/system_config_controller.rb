class V1::SystemConfigController < V1::BaseController
  before_action -> { authentication!(false) }

  def index
    render json: SystemConfigOperations::Index.new(params, actor).call,
           serializer: SystemConfigs::IndexSerializer
  end
end
