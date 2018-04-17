class ApplicationOperation
  attr_accessor :params, :actor

  def initialize(params, actor = nil)
    @params = params
    @actor  = actor
  end

  def call; end

  def paginate_params
    params[:per_page] ||= 12
    { page: params[:page], per_page: params[:per_page] }
  end
end
