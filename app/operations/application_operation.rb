class ApplicationOperation
  attr_accessor :params, :user

  def initialize(params, actor = nil)
    @params = params
    @user   = user
  end

  def call; end

  def paginate_params
    params[:per_page] ||= 10
    { page: params[:page], per_page: params[:per_page] }
  end
end
