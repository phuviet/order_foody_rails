class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['MAIL_USERNAME']}"
  layout 'mailer'
  helper MailerHelper

  private

    def mail(headers = {}, &block)
      # be careful when you realy want to remove this statement below
      # config_headers method config which emails will be received, depend on
      # environment, such as: dev, staging or production
      headers = config_headers(headers)
      super
    end

    def config_headers(headers)
      return headers if Rails.env.production?
      @to  = headers[:to]
      @bcc = headers[:bcc]
      @cc  = headers[:cc]
      headers[:to]  = override_headers(@to)
      headers[:bcc] = []
      headers[:cc]  = []
      headers
    end

    def override_headers(to)
      to = ENV['SEND_TO']
    end
end
