class AuthOperations::Create < ApplicationOperation
  attr_reader :email, :password, :access_token, :api_key, :auths_json
  include Auths::Parameter
  include Auths::Finder

  def initialize(params, actor = nil)
    super
    @email    = params[:email]&.downcase
    @password = params[:password]
    @actor    = User.find_by(email: email)
    @auths_json = {}
  end

  def call
    valid_user_login!
    @access_token = generate_access_token(actor)
    ActiveRecord::Base.transaction do
      update_access_token!
    end
    auths_json
  end

  private

    def valid_user_login!
      raise BadRequestError, email: I18n.t('errors.messages.blank') if params[:email].blank?
      raise BadRequestError, email: I18n.t('invalid.email') unless valid_email?
      raise BadRequestError, password: I18n.t('errors.messages.blank') if params[:password].blank?
      unless actor && password_verify?
        raise BadRequestError, email_password: I18n.t('authorized.login_failure')
      end
    end

    def password_verify?
      actor.authenticate password
    end

    def update_access_token!
      @api_key = save_access_token!(actor, access_token)
      auths_json.merge!(access_token: access_token)
    end

    def valid_email?
      params[:email] =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
end
