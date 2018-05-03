class UsersOperations::RegisterOperations::Create < ApplicationOperation

  include Users::Parameter

  attr_reader :user

  def call
    create_user!
    # send_email
  end

  private

    def create_user!
      @user = User.new(user_register_params)
      @user.valid!
      @user.tap(&:save)
    end

    def send_email
      UserMailer.mail_order(order).deliver_later(wait: 5.seconds)
    end
end
