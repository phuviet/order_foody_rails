class ProfileOperations::PasswordOperations::Update < ApplicationOperation
  attr_reader :password, :current_password
  include Users::Parameter

  def initialize(params, actor = nil)
    super
    @current_password = params[:current_password]
    @password = params[:password]
  end

  def call
    password_verify?
    change_password!
    actor
  end

  private

    def change_password!
      validate_params
      unless password_verify?
        raise BadRequestError, current_password: I18n.t('user.current_password_incorrect')
      end
      actor.update!(
        password: params[:password], password_confirmation: params[:password_confirmation]
      )
    end

    def password_verify?
      actor.authenticate current_password
    end

    def validate_params
      raise BadRequestError, password: I18n.t('errors.messages.blank') if params[:password].blank?
      if params[:current_password].blank?
        raise BadRequestError, current_password: I18n.t('errors.messages.blank')
      end
      if params[:password_confirmation].blank?
        raise BadRequestError, password_confirmation: I18n.t('errors.messages.blank')
      end
    end
end
