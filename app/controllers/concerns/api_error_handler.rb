module APIErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from BadRequestError do |e|
      error_response(e.errors, :bad_request)
    end

    rescue_from UnauthorizedError do |e|
      error_response(e.errors, :unauthorized)
    end

    rescue_from ActiveRecord::RecordNotFound do |_e|
      error_response(I18n.t('models.does_not_exists'), :not_found)
    end

    rescue_from ActiveRecord::InvalidForeignKey do |_e|
      error_response(I18n.t('invalid.foreign_key'), :invalid_foreign_key)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error_response(e.message, :bad_request)
    end

    rescue_from NotImplementedError do |e|
      error_response(e.message, :not_implemented)
    end

    rescue_from ArgumentError do |e|
      error_response(e.message, :argument_error)
    end

    rescue_from NoMethodError do |e|
      Rails.logger.error('Internal server error occurred.')
      Rails.logger.error("  type: #{e.class.name}")
      Rails.logger.error("  message: #{e.message}")
      Rails.logger.error('  backtrace:')
      Rails.logger.error('    ' + e.backtrace.join("\n    "))
      error_response(I18n.t('errors.internal_server_error'), :internal_server_error)
    end
  end

  private

    def error_response(errors, status)
      keys = errors.is_a?(String) ? :messages : :errors
      render json: { keys => errors }, status: status
    end
end
