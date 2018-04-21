module Authorizable
  extend ActiveSupport::Concern

  def authentication!(valid = true)
    @valid = valid
    return if !@valid && (http_token.blank? || http_token_data)
    verify_token!
    verify_api_key!
    verify_actor!
    PaperTrail.whodunnit = actor.id
  end

  def actor
    return if !@valid && http_token.blank?
    return if api_key.nil? && !@valid
    @actor ||= api_key.user
  end

  def api_key
    @api_key ||= ApiKey.find_by(access_token: http_token)
  end

  private

    def verify_token!
      raise UnauthorizedError, authorization: I18n.t('authorized.unauthorized') unless valid_token?
    end

    def verify_api_key!
      raise UnauthorizedError, access_token: I18n.t('invalid.access_token') unless api_key
    end

    def verify_actor!
      raise UnauthorizedError, I18n.t('authorized.unauthorized') unless actor
    end

    def auth_token
      raise UnauthorizedError, authorization: I18n.t('authorized.unauthorized') if http_token_data
      @auth_token ||= JsonWebToken.decode(http_token)
    end

    def http_token
      request.headers[:HTTP_AUTHORIZATION]
    end

    def valid_token?
      http_token && auth_token
    end

    def http_token_data
      http_token == 'null' || http_token == 'undefined'
    end
end
