class UsersOperations::ConfirmOperations::Update < ApplicationOperation
  include Users::Parameter

  attr_reader :user

  def call
    @user = User.find_by!(confirm_at: nil, confirm_token: params[:confirm_token])
    update_user!
    user
  end

  private

    def update_user!
      @user.skip_password_validation = true
      @user.update!(user_confirm_params.merge(confirm_at: Time.zone.now))
    rescue ActiveRecord::RecordInvalid
      raise BadRequestError, @user.errors.messages
    end
end
