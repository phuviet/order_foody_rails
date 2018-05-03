class UserMailer < ApplicationMailer
  def register(user)
    @user = user
    @url = ENV['HOST_FE'] + '/register/' + @user.confirm_token
    mail(to: @user.email, subject: 'Order Foody - Register')
  end
end
