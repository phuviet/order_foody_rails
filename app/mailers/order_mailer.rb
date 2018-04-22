class OrderMailer < ApplicationMailer
  def mail_order(order)
    @user        = order.user
    @order       = order
    @order_items = order.order_items
    mail(to: @user.email, subject: 'Order Foody - Confirm Order')
  end
end
