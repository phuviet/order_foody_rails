class ProfileOperations::Update < ApplicationOperation
  include Users::Finder
  include Users::Parameter

  attr_reader :user

  def initialize(params, actor = nil)
    super
    @user = load_user!(actor.id)
  end

  def call
    update_user!
    user
  end

  private

    def update_user!
      @user.skip_password_validation = true
      @user.update!(user_update_params)
    rescue ActiveRecord::RecordInvalid
      raise BadRequestError, @user.errors.messages
    end
end
