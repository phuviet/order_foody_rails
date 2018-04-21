class AuthOperations::Destroy < ApplicationOperation
  def initialize(actor, params)
    super
  end

  def call
    logout!
  end

  private

    def logout!
      return actor if actor.api_key.update(access_token: Time.now.to_i)
      raise NotImplementedError, I18n.t('authorized.logout_failure')
    end
end
