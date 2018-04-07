class ApplicationOperation
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def call; end

  def paginate_params
    { page: params[:page], per_page: params[:per_page] }
  end
end
